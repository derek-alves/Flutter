import 'package:feichas/core/clientHttp/default_response.dart';

abstract class IGetAllItemsRepository {
  Future<DefaultResponse> getAllItems();
}
