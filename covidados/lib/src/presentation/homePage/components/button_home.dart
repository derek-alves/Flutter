import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final int color;
  final String image;
  final String title;

  ButtonHome({required this.color, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          print("foi");
        },
        child: Card(
          elevation: 5,
          color: Color(this.color),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                maxRadius: constraints.maxHeight * 0.25,
                backgroundColor: Color(0xffF8F8F8),
                child: AspectRatio(
                    aspectRatio: 1.3,
                    child: Image.asset(
                      this.image,
                      fit: BoxFit.contain,
                    )),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                this.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
    });
  }
}
