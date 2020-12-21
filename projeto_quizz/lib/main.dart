import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(QuizzApp());

class _PerguntaAppState extends State<QuizzApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void Function() funcaoQueRetornaOutraFuncao() {
    return () {
      print('Pergunta respondida de outra maneira!!');
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Quizz App'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(),
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
