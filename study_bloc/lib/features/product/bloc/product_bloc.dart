import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_bloc/features/product/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  Product _product = Product.empty();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is ProductEventUpdate) {
      _updateProduct(
          barCode: event.barCode,
          category: event.category,
          image: event.image,
          name: event.name,
          value: event.value);
      yield ProductDefaultState(product: _product);
    }
  }

  Product get product => _product;

  _updateProduct({
    String? name,
    String? barCode,
    String? category,
    double? value,
    String? image,
  }) {
    _product = _product.copyWith(
        name: name,
        barCode: barCode,
        category: category,
        value: value,
        image: image);
  }
}
