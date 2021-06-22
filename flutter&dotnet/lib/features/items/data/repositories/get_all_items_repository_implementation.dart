import 'package:feichas/features/items/data/datasource/get_all_items_datasource_implementation.dart';
import 'package:feichas/features/items/domain/entities/item_entity.dart';
import 'package:feichas/features/items/domain/repositories/get_all_items_repository.dart';

class GetAllItemsRepositoryImplementation implements IGetAllItemsRepository {
  final GetAllItemsDatasourceImplementation datasource;

  GetAllItemsRepositoryImplementation(this.datasource);
  @override
  Future<List<IItemEntity>> getAllItems() async {
    return await datasource.getAllItems();
  }
}
