import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
>>>>>>> efdda088719da20bec8a45dadc0fcc0a02341f22
import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
<<<<<<< HEAD
=======
      
>>>>>>> efdda088719da20bec8a45dadc0fcc0a02341f22
    );
  }
}
