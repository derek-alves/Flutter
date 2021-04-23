import 'package:flutter/material.dart';

class ButtonSympt extends StatelessWidget {
  final String img;
  final String title;
  const ButtonSympt({required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return Container(
      width: widthScreen * 0.27,
      height: heightScreen * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffF79339),
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              iconSize: heightScreen * 0.05,
              icon: Image.asset(img),
              onPressed: () {},
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: widthScreen * 0.038),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
