import 'package:feichas/features/items/domain/entities/item_entity.dart';

class ItemModel extends IItemEntity {
  const ItemModel(
    String id,
    String name,
    double price,
  ) : super(
          id,
          name,
          price,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      map['id'],
      map['name'],
      map['price'],
    );
  }
}
