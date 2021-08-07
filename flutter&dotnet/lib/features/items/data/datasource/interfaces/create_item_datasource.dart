import 'package:feichas/features/items/data/models/default_create_response_model.dart';

abstract class ICreateItemDatasource {
  Future<DefaultCreateResponseModel> create(Map<String, dynamic> id);
}
