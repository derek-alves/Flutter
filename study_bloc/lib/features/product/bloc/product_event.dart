part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductEventUpdate extends ProductEvent {
  final String? name;
  final String? barCode;
  final String? category;
  final double? value;
  final String? image;

  const ProductEventUpdate({
    this.name,
    this.barCode,
    this.category,
    this.value,
    this.image,
  });
}
