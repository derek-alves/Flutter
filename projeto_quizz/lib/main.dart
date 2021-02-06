import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(QuizzApp());

class _PerguntaAppState extends State<QuizzApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual é sua cor favorita?",
      "respostas": [
        {'texto': 'Preto', 'pontuacao': 4},
        {'texto': 'rosa', 'pontuacao': 2},
        {'texto': 'branco', 'pontuacao': 3},
        {'texto': 'azul', 'pontuacao': 7},
      ]
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {'texto': 'Urso', 'pontuacao': 4},
        {'texto': 'bode', 'pontuacao': 10},
        {'texto': 'cachorro', 'pontuacao': 5},
        {'texto': 'vaca', 'pontuacao': 9},
      ]
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": [
        {'texto': 'Paulo', 'pontuacao': 10},
        {'texto': 'Pablo', 'pontuacao': 2},
        {'texto': 'Dirce', 'pontuacao': 3},
        {'texto': 'Bruna', 'pontuacao': 7},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
