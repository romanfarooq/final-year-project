import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPickerDialog extends StatefulWidget {
  const LocationPickerDialog({super.key});

  @override
  State<LocationPickerDialog> createState() => _LocationPickerDialogState();
}

class _LocationPickerDialogState extends State<LocationPickerDialog> {
  final _controller = Completer<GoogleMapController>();
  final _initialPosition = const LatLng(31.447101066394143, 74.2682959730143);
  LatLng? _pickedLocation;
  LatLng? _currentLocation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      _currentLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 5),
      contentPadding: const EdgeInsets.all(10),
      content: SizedBox(
        width: double.maxFinite,
        height: 400,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        onMapCreated: (controller) {
                          _controller.complete(controller);
                        },
                        onTap: (location) {
                          setState(() {
                            _pickedLocation = location;
                          });
                        },
                        markers: _pickedLocation != null
                            ? {
                                Marker(
                                  markerId: const MarkerId('selected-location'),
                                  position: _pickedLocation!,
                                ),
                              }
                            : _currentLocation != null
                                ? {
                                    Marker(
                                      markerId:
                                          const MarkerId('current-location'),
                                      position: _currentLocation!,
                                    ),
                                  }
                                : {},
                        initialCameraPosition: CameraPosition(
                          target: _currentLocation ?? _initialPosition,
                          zoom: 14,
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _pickedLocation != null
                    ? [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Latitude: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(_pickedLocation!.latitude.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Longitude: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(_pickedLocation!.longitude.toString()),
                          ],
                        ),
                      ]
                    : _currentLocation != null
                        ? [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Latitude: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(_currentLocation!.latitude.toString()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Longitude: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(_currentLocation!.longitude.toString()),
                              ],
                            ),
                          ]
                        : [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Latitude: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('0'),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Longitude: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('0'),
                              ],
                            ),
                          ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 247, 94, 83),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(96, 189, 52, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(
                        _pickedLocation ?? _currentLocation,
                      );
                    },
                    child: const Text(
                      "Select",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
