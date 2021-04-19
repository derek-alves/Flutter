import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 80,
              height: 80,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("Vamos começar"),
                Text("Complete os desafios e avance em conhecimeto")
              ],
            ),
          )
        ],
      ),
    );
  }
}
