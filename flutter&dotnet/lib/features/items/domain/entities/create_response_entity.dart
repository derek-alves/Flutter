import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:feichas/features/items/data/models/item_model.dart';
import 'package:feichas/features/items/domain/entities/item_entity.dart';

abstract class IDefaultCreateResponseEntity extends Equatable {
  final IItemEntity item;
  final String message;

  const IDefaultCreateResponseEntity(this.item, this.message);
  @override
  List<Object?> get props => [item, message];
}
