import 'package:despesas/components/transaction_form.dart';
import 'package:despesas/components/transaction_list.dart';
import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 210.50,
      data: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Nova conta de luz',
      value: 40.10,
      data: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Card(
              color: Colors.purple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Gráfico',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              elevation: 5,
            ),
          ),
          TransactionList(_transactions),
          TransactionForm(),
        ],
      ),
    );
  }
}
