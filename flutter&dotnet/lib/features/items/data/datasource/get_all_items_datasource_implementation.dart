import 'package:feichas/core/clientHttp/default_response.dart';
import 'package:feichas/core/clientHttp/getx_client_http.dart';
import 'package:feichas/features/items/data/datasource/interfaces/get_all_items_datasource.dart';

class GetAllItemsDatasourceImplementation implements IGetAllItemsDatasource {
  final GetxClientHttp client;

  GetAllItemsDatasourceImplementation(this.client);

  @override
  Future<DefaultResponse> getAllItems() async {
    try {
      final response = await client.get("http://192.168.1.7:5000/items");
      final value = DefaultResponse.fromMap(response.body);
      print(value);
      return value;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
