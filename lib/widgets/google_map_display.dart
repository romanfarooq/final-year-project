import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../models/workshop_info.dart';
import '../utils/figma_space_to_percentage.dart';

class GoogleMapDisplay extends StatefulWidget {
  const GoogleMapDisplay({super.key});

  @override
  State<GoogleMapDisplay> createState() => _GoogleMapDisplayState();
}

class _GoogleMapDisplayState extends State<GoogleMapDisplay> {
  final _controller = Completer<GoogleMapController>();
  final _location = Location();
  final _initialPosition = const LatLng(31.447101066394143, 74.2682959730143);

  LatLng? _currentPosition;
  Marker? _currentMarker;
  Set<Marker> _workshopMarkers = {};

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _setWorkshopMarkers();
  }

  void _requestLocationPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition = LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        );
        _updateCurrentMarker();
      });
      _animateToCurrentLocation();
    });

    _setInitialLocation();
  }

  void _setInitialLocation() async {
    LocationData locationData = await _location.getLocation();
    setState(() {
      _currentPosition =
          LatLng(locationData.latitude!, locationData.longitude!);
      _updateCurrentMarker();
    });
  }

  void _updateCurrentMarker() {
    setState(() {
      if (_currentPosition != null) {
        _currentMarker = Marker(
          markerId: const MarkerId('currentLocation'),
          position: _currentPosition!,
          infoWindow: const InfoWindow(title: 'You are here'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        );
      }
    });
  }

  Future<void> _animateToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    if (_currentPosition != null) {
      controller.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
    }
  }

  void _setWorkshopMarkers() {
    final workshops = context.read<Workshops>().getWorkshops;
    Set<Marker> markers = workshops.map((workshop) {
      return Marker(
        markerId: MarkerId(workshop.getWorkshopName),
        position: workshop.getLocation,
        infoWindow: InfoWindow(title: workshop.getWorkshopName),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
    }).toSet();

    setState(() {
      _workshopMarkers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: figmaSpaceToPercentageHeight(300, context),
          child: GoogleMap(
            onMapCreated: (controller) {
              _controller.complete(controller);
              _animateToCurrentLocation();
            },
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14,
            ),
            markers: _currentMarker != null
                ? {_currentMarker!, ..._workshopMarkers}
                : _workshopMarkers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            tiltGesturesEnabled: true,
            rotateGesturesEnabled: true,
          ),
        ),
      ),
    );
  }
}
