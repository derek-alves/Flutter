part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductDefaultState extends ProductState {
  const ProductDefaultState({
    required this.product,
  });

  final Product product;

  @override
  List<Object> get props => [];
}
