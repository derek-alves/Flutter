import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? name;
  final String? barCode;
  final String? category;
  final double? value;
  final String? image;

  const Product({
    this.name,
    this.category,
    this.value,
    this.image,
    this.barCode,
  });

  Product.empty({
    this.name = "",
    this.category = "",
    this.value = 0.0,
    this.image = "",
    this.barCode = "",
  });

  @override
  List<Object?> get props => [
        name,
        category,
        value,
        image,
        barCode,
      ];

  Product copyWith({
    String? name,
    String? barCode,
    String? category,
    double? value,
    String? image,
  }) {
    return Product(
      barCode: barCode,
      category: category,
      image: image,
      name: name,
      value: value,
    );
  }
}
