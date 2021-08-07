import 'package:feichas/features/items/domain/entities/create_response_entity.dart';

abstract class ICreateItemRepository {
  Future<IDefaultCreateResponseEntity> create(Map<String, dynamic> id);
}
