import 'dart:async'; // Add this import
import 'package:car_care/utils/figma_space_to_percentage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapDisplay extends StatefulWidget {
  const GoogleMapDisplay({super.key});

  @override
  State<StatefulWidget> createState() => _GoogleMapDisplayState();
}

class _GoogleMapDisplayState extends State<GoogleMapDisplay> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Location _location = Location();
  final LatLng _initialPosition = const LatLng(
    31.447101066394143,
    74.2682959730143,
  ); // UCP
  LatLng? _currentPosition;
  Marker? _currentMarker;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
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
        _updateMarker();
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
      _updateMarker();
    });
  }

  void _updateMarker() {
    setState(() {
      if (_currentPosition != null) {
        _currentMarker = Marker(
          markerId: const MarkerId('currentLocation'),
          position: _currentPosition!,
          infoWindow: const InfoWindow(title: 'You are here'),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: figmaSpaceToPercentage(300, context),
          child: GoogleMap(
            onMapCreated: (controller) {
              _controller.complete(controller);
              _animateToCurrentLocation();
            },
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14,
            ),
            markers: _currentMarker != null ? {_currentMarker!} : {},
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ),
      ),
    );
  }
}
