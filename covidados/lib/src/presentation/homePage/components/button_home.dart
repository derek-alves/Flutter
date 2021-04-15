import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final int color;
  final String image;
  final String title;

  ButtonHome({required this.color, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("foi");
      },
      child: Card(
        color: Color(this.color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 33,
              backgroundColor: Color(0xffF8F8F8),
              child: Image.asset(this.image),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              this.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
