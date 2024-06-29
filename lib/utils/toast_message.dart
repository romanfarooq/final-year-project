import'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage{

void toastmessage(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 20,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );

}

}