import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  final GlobalKey _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Page'),
        ),
        body: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Nome"),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Cetegoria"),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "imagem"),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "valor"),
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "codigo de barras"),
                  ),
                ],
              ),
            )));
  }
}
