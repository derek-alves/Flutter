import 'package:feichas/core/clientHttp/getx_client_http.dart';

import 'interfaces/delete_item.datasource.dart';

class DeleteItemDatasourceImplementation implements IDeleteItemDatasource {
  final GetxClientHttp client;

  DeleteItemDatasourceImplementation(this.client);

  @override
  Future<void> delete(int id) async {
    try {
      await client.delete("http://192.168.1.7:5000/item/$id");

      return;
    } catch (e) {
      rethrow;
    }
  }
}
