import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/drawer.dart';
import 'package:shop/components/order_widget.dart';
import 'package:shop/provider/order.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, index) => OrderWidget(orders.items[index]),
      ),
    );
  }
}
