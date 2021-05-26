import 'package:flutter/material.dart';

class ButtonVirusWidget extends StatelessWidget {
  final String title;

  const ButtonVirusWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xFFCF1845)),
        child: Text(
          title,
          style: TextStyle(fontSize: 15, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
