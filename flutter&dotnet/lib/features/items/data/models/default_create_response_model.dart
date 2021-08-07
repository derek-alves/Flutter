import 'package:feichas/features/items/data/models/item_model.dart';
import 'package:feichas/features/items/domain/entities/create_response_entity.dart';

class DefaultCreateResponseModel extends IDefaultCreateResponseEntity {
  const DefaultCreateResponseModel(ItemModel items, String message)
      : super(items, message);

  Map<String, dynamic> toMap() {
    return {
      'item': item.toMap(),
      'message': message,
    };
  }

  factory DefaultCreateResponseModel.fromMap(Map<String, dynamic> map) {
    return DefaultCreateResponseModel(
      ItemModel.fromMap(map['item']),
      map['message'],
    );
  }
}
