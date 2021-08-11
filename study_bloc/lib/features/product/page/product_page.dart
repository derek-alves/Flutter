import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc/features/product/bloc/product_bloc.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  final GlobalKey _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProductBloc>(context);
    var product = bloc.product;

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
                    onChanged: (name) =>
                        bloc.add(ProductEventUpdate(name: name)),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Cetegoria"),
                    onChanged: (category) =>
                        bloc.add(ProductEventUpdate(category: category)),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "imagem"),
                    onChanged: (image) =>
                        bloc.add(ProductEventUpdate(image: image)),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "valor"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => bloc
                        .add(ProductEventUpdate(value: double.parse(value))),
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "codigo de barras"),
                    onChanged: (barCode) =>
                        bloc.add(ProductEventUpdate(barCode: barCode)),
                  ),
                  Column(
                    children: [
                      const Text("Detalhes do produto"),
                      Text(product.name!),
                      Text(product.category!),
                      Text(product.image!),
                      Text(product.value!.toString()),
                      Text(product.name!),
                    ],
                  )
                ],
              ),
            )));
  }
}
