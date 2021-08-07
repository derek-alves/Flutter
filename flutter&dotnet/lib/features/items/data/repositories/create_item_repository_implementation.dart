import 'package:feichas/features/items/data/datasource/create_item_datasource_implmentation.dart';
import 'package:feichas/features/items/data/models/default_create_response_model.dart';
import 'package:feichas/features/items/domain/repositories/create_item_repository.dart';

class CreateItemRepositoryImplementation implements ICreateItemRepository {
  final CreateItemDatasourceImplementation datasource;

  CreateItemRepositoryImplementation(this.datasource);
  @override
  Future<DefaultCreateResponseModel> create(Map<String, dynamic> item) async {
    return await datasource.create(item);
  }
}
