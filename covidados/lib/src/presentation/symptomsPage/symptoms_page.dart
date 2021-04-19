import 'package:flutter/material.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF79339),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight * 0.15,
                  width: double.infinity,
                  child: Text(
                    "SINTOMAS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: constraints.maxHeight * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
