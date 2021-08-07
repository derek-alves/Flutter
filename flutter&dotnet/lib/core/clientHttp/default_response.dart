import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:feichas/features/items/data/models/item_model.dart';

class DefaultResponse extends Equatable {
  final List<ItemModel> items;
  final String? message;

  const DefaultResponse(this.items, this.message);
  @override
  List<Object?> get props => [items, message];

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
      'message': message,
    };
  }

  factory DefaultResponse.fromMap(Map<String, dynamic> map) {
    return DefaultResponse(
      List<ItemModel>.from(map['items']?.map((x) => ItemModel.fromMap(x))),
      map['message'],
    );
  }
}
