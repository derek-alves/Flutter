import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String barCode;
  final String category;
  final double value;
  final String image;

  const Product({
    required this.name,
    required this.category,
    required this.value,
    required this.image,
    required this.barCode,
  });

  @override
  List<Object> get props => [
        name,
        category,
        value,
        image,
        barCode,
      ];

  Product copyWith({
    required String name,
    required String barCode,
    required String category,
    required double value,
    required String image,
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
