import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../utils/toast_message.dart';

Future<Map<String, String>> fetchDistance(
  LatLng origin,
  LatLng destination,
) async {
  const String apiKey = 'AIzaSyBiJh4CZ-9f9On4YcFzNovAjZEtCZ_1x0I';
  final String url =
      'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=${origin.latitude},${origin.longitude}&destinations=${destination.latitude},${destination.longitude}&key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    if (data['status'] == 'OK') {
      String distanceText = data['rows'][0]['elements'][0]['distance']['text'];
      String durationText = data['rows'][0]['elements'][0]['duration']['text'];
      return {
        'distance': distanceText,
        'duration': durationText,
      };
    } else {
      ToastMessage().toastmessage(
        'Failed to fetch distance: ${data['status']}',
      );
    }
  } else {
    ToastMessage().toastmessage(
      'Failed to fetch distance: ${response.statusCode}',
    );
  }
  return {
    'distance': '0',
    'duration': '0',
  };
}
