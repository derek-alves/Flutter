import 'package:feichas/core/usecase/usecase.dart';
import 'package:feichas/features/items/domain/entities/item_entity.dart';
import 'package:feichas/features/items/domain/repositories/get_all_items_repository.dart';

class IGetAllItemsUsecase implements Usecase<List<IItemEntity>, void> {
  final IGetAllItemsRepository _repository;

  IGetAllItemsUsecase(this._repository);

  @override
  Future<List<IItemEntity>> call(void params) async {
    return await _repository.getAllItems();
  }
}
