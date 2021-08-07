import 'package:feichas/core/clientHttp/getx_client_http.dart';
import 'package:feichas/features/items/data/models/default_create_response_model.dart';

import 'interfaces/create_item_datasource.dart';
import 'interfaces/delete_item.datasource.dart';

class CreateItemDatasourceImplementation implements ICreateItemDatasource {
  final GetxClientHttp client;

  CreateItemDatasourceImplementation(this.client);

  @override
  Future<DefaultCreateResponseModel> create(Map<String, dynamic> item) async {
    try {
      final response = await client.post("http://192.168.1.7:5000/item", item);

      return DefaultCreateResponseModel.fromMap(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
