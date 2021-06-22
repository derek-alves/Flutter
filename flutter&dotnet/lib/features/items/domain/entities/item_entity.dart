import 'dart:convert';

import 'package:equatable/equatable.dart';

abstract class IItemEntity extends Equatable {
  final String id;
  final String name;
  final double price;

  const IItemEntity(this.id, this.name, this.price);

  @override
  List<Object?> get props => [id, name, price];
}
