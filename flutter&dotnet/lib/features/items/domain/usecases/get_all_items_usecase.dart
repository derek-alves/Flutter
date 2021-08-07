import 'package:feichas/core/clientHttp/default_response.dart';
import 'package:feichas/core/usecase/usecase.dart';
import 'package:feichas/features/items/domain/repositories/get_all_items_repository.dart';

class IGetAllItemsUsecase implements Usecase<DefaultResponse, void> {
  final IGetAllItemsRepository _repository;

  IGetAllItemsUsecase(this._repository);

  @override
  Future<DefaultResponse> call(void params) async {
    return await _repository.getAllItems();
  }
}
