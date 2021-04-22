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
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.86,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.8,
                                child: Text.rich(
                                  TextSpan(
                                    text: "Em média, os sintomas aparecem ",
                                    children: [
                                      TextSpan(
                                        text: "após 5 ou 6 dias ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            "depois de ser  infectados com o vírus. Porém, isso pode levar até ",
                                        children: [
                                          TextSpan(
                                              text: "14 dias.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.053,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Image.asset(
                                "assets/img.png",
                                fit: BoxFit.scaleDown,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [],
                    )
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
