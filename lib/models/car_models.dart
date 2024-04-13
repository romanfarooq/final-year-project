import 'package:flutter/material.dart';

class CarModel {
  //private variables
  Image _image;
  String _licensePlate;
  // HISTORYY

  //Functions
  // Constructor
  CarModel(this._image, this._licensePlate);

  // Getter for image
  Image get image => _image;

  // Setter for image
  set image(Image value) {
    _image = value;
  }

  // Getter for licensePlate
  String get licensePlate => _licensePlate;

  // Setter for licensePlate
  set licensePlate(String value) {
    _licensePlate = value;
  }
}