import 'package:feichas/core/clientHttp/getx_client_http.dart';
import 'package:feichas/core/endpoints/dotnet_endpoints.dart';
import 'package:feichas/features/items/data/datasource/interfaces/get_all_items_datasource.dart';
import 'package:feichas/features/items/data/models/item_model.dart';

class GetAllItemsDatasourceImplementation implements IGetAllItemsDatasource {
  final GetxClientHttp client;

  GetAllItemsDatasourceImplementation(this.client);

  @override
  Future<List<ItemModel>> getAllItems() async {
    try {
      final response = await client.get("https://192.168.1.7:5001/items");
      print(response.statusCode);
      final List<dynamic> items = response.body;

      return items.map<ItemModel>((item) => ItemModel.fromMap(item)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
