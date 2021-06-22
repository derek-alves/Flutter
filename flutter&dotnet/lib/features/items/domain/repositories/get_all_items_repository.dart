import 'package:feichas/features/items/domain/entities/item_entity.dart';

abstract class IGetAllItemsRepository {
  Future<List<IItemEntity>> getAllItems();
}
