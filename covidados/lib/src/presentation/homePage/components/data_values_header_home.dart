import 'package:flutter/material.dart';

class ValuesHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Column(
            children: [
              Text(
                "CONFIRMADOS",
                style: TextStyle(
                    color: Colors.white, fontSize: constraints.maxWidth * 0.02),
              ),
              Text(
                "007.256",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: constraints.maxWidth * 0.06,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        );
      },
    );
  }
}
