import 'package:feichas/core/clientHttp/default_response.dart';

abstract class IGetAllItemsDatasource {
  Future<DefaultResponse> getAllItems();
}
