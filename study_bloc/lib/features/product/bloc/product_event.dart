part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductEventUpdate extends ProductEvent {
  final String name;
  final String barCode;
  final String category;
  final double value;
  final String image;

  const ProductEventUpdate({
    required this.name,
    required this.barCode,
    required this.category,
    required this.value,
    required this.image,
  });
}
