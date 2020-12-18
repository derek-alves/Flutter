import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(QuizzApp());

class QuizzApp extends StatelessWidget {
  var perguntaSelecionada = 0;
  void responder() {
    perguntaSelecionada++;
    print(perguntaSelecionada);
  }

  void Function() funcaoQueRetornaOutraFuncao() {
    return () {
      print('Pergunta respondida de outra maneira!!');
    };
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "Qual é sua cor favorita?",
      "Qual é o seu animal favorito?"
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz App'),
        ),
        body: Column(
          children: [
            Text(perguntas.elementAt(perguntaSelecionada)),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('exemplo 2'),
              onPressed: funcaoQueRetornaOutraFuncao(),
            ),
            RaisedButton(
              child: Text('exemplo 3'),
              onPressed: () {
                print('Resposta numero 3');
              },
            ),
            RaisedButton(
              child: Text('exemplo 4'),
              onPressed: () => print('Resposta numero 4'),
            ),
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
