import 'package:flutter/material.dart';

class ButtonSympt extends StatelessWidget {
  final String img;
  final String title;
  final String text;
  const ButtonSympt(
      {required this.img, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                      height: 200,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              text,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -17,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffF79339),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(img),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        width: widthScreen * 0.30,
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
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 250,
                            child: Column(
                              children: [Text("FEBRE")],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: widthScreen * 0.0352),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
