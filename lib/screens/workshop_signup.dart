
import 'package:car_care/main.dart';
import 'package:flutter/material.dart';

class WorkshopSignup extends StatefulWidget {
  const WorkshopSignup({super.key});

  @override
  State<WorkshopSignup> createState() => _WorkshopSignupState();
}

class _WorkshopSignupState extends State<WorkshopSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         children: [
           Container(
             width: 150,
             height: 250,
             color: Colors.yellow
           )
         ],

      ),
    );
  }
}
