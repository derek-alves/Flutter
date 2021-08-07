import 'package:feichas/features/items/data/datasource/delete_item_datasource_implementation.dart';
import 'package:feichas/features/items/domain/repositories/delete_item_repository.dart';

class DeleteItemRepositoryImplementation implements IDeleteItemRepository {
  final DeleteItemDatasourceImplementation datasource;

  DeleteItemRepositoryImplementation(this.datasource);
  @override
  Future<void> delete(int id) async {
    return await datasource.delete(id);
  }
}
