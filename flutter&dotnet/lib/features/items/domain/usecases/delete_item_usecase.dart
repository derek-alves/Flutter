import 'package:feichas/core/usecase/usecase.dart';
import 'package:feichas/features/items/domain/repositories/delete_item_repository.dart';

class IDeleteItemUsecase implements Usecase<void, int> {
  final IDeleteItemRepository _repository;

  IDeleteItemUsecase(this._repository);

  @override
  Future<void> call(int params) async {
    return await _repository.delete(params);
  }
}
