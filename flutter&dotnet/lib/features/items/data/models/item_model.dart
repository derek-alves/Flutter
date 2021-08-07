import 'package:feichas/features/items/domain/entities/item_entity.dart';

class ItemModel extends IItemEntity {
  const ItemModel(
    int id,
    String title,
  ) : super(
          id,
          title,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      map['id'],
      map['title'],
    );
  }
}
