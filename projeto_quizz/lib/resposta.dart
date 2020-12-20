import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  Resposta(this.texto,this.onSelection);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      child: RaisedButton(
          child: Text(texto),
          onPressed: onSelection,
          textColor: Colors.white,
          color: Colors.blue),
    );
  }
}
