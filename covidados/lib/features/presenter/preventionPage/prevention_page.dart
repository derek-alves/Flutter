import 'package:flutter/material.dart';

class PreventionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392045),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 20),
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
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * 0.028,
                                      fontWeight: FontWeight.w400),
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
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
