import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questão.dart';
import './resposta.dart';

main() => runApp(QuizzApp());

class _PerguntaAppState extends State<QuizzApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  void Function() funcaoQueRetornaOutraFuncao() {
    return () {
      print('Pergunta respondida de outra maneira!!');
    };
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        "texto": "Qual é sua cor favorita?",
        "respostas": ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        "texto": "Qual é o seu animal favorito?",
        "respostas": ['Cavalo', 'Carneiro', 'Tatu', 'Vaca']
      },
      {
        "texto": "Qual é o seu instrutor favorito?",
        "respostas": ['Maria', 'Paulo', 'Pablo', 'Parang']
      }
    ];

    List<Widget> respostas = [];

    for (String textoResp in perguntas[_perguntaSelecionada]['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Quizz App'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            ...respostas,
            // //Exemplos
            //
            // RaisedButton(
            //   child: Text('Resposta 1'),
            //   onPressed: _responder,
            // ),
            // RaisedButton(
            //   child: Text('exemplo 2'),
            //   onPressed: funcaoQueRetornaOutraFuncao(),
            // ),
            // RaisedButton(
            //   child: Text('exemplo 3'),
            //   onPressed: () {
            //     print('Resposta numero 3');
            //   },
            // ),
            // RaisedButton(
            //   child: Text('exemplo 4'),
            //   onPressed: () => print('Resposta numero 4'),
            // ),
            // Column(
            //   children: [],
            // )
          ],
        ),
      ),
    );
  }
}

class QuizzApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
