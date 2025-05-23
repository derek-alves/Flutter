import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/provider/cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  const Order({
    this.id,
    this.products,
    this.total,
    this.date,
  });
}

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(List<CartItem> products, double total) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: total,
        date: DateTime.now(),
        products: products,
      ),
    );
    notifyListeners();
  }
}
