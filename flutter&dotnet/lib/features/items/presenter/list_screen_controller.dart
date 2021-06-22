import 'package:feichas/features/items/data/models/item_model.dart';
import 'package:feichas/features/items/data/repositories/get_all_items_repository_implementation.dart';
import 'package:get/get.dart';

class ListScreenController extends GetxController with StateMixin {
  final GetAllItemsRepositoryImplementation repository;

  final RxBool done = false.obs;

  final RxString item = "".obs;

  void toogleDone() => done.value = !done.value;

  ListScreenController(this.repository);

  @override
  void onInit() {
    getAllItems();
    super.onInit();
  }

  void setNewItem(String value) => item.value = value;

  Future<void> getAllItems() async {
    change([], status: RxStatus.loading());

    try {
      final items = await repository.getAllItems();
      change([
        const ItemModel("39617e28-a640-46e4-94f3-ef91d0a9f33c", "cabra", 20)
      ], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error("Erro ao buscar os items"));
    }
  }
}
