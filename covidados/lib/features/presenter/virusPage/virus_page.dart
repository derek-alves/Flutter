import 'package:flutter/material.dart';

class VirusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCF1845),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: constraints.maxHeight * 0.1,
                width: double.infinity,
                child: Text(
                  "Prevenção",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: constraints.maxWidth * 0.08,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: constraints.maxHeight * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                )
              ]),
            ],
          );
        }),
      ),
    );
  }
}
