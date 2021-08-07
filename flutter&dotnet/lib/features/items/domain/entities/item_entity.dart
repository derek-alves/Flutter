import 'dart:convert';

import 'package:equatable/equatable.dart';

abstract class IItemEntity extends Equatable {
  final int id;
  final String title;

  const IItemEntity(this.id, this.title);

  @override
  List<Object?> get props => [id, title];

  toMap() {}

  static fromMap(x) {}
}
