import 'package:feichas/features/items/data/models/item_model.dart';

abstract class IGetAllItemsDatasource {
  Future<List<ItemModel>> getAllItems();
}
