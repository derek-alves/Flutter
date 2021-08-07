import 'package:feichas/core/usecase/usecase.dart';
import 'package:feichas/features/items/domain/entities/create_response_entity.dart';
import 'package:feichas/features/items/domain/repositories/create_item_repository.dart';
import 'package:feichas/features/items/domain/repositories/delete_item_repository.dart';

class ICreateItemUsecase implements Usecase<void, Map<String, dynamic>> {
  final ICreateItemRepository _repository;

  ICreateItemUsecase(this._repository);

  @override
  Future<IDefaultCreateResponseEntity> call(Map<String, dynamic> params) async {
    return await _repository.create(params);
  }
}
