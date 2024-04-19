import 'package:flutter/material.dart';

class ServiceHistory extends StatelessWidget {
  final String text;

  const ServiceHistory({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width * 0.93,
      margin: const EdgeInsets.only(left: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        shape: BoxShape.rectangle,
        color: const Color.fromARGB(255, 228, 228, 228),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: -1,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Define the action when the button is tapped
                    // print('Button tapped');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(220, 221, 221, 221),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Icon(
                      Icons.info,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
