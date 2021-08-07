import 'package:feichas/core/clientHttp/default_response.dart';
import 'package:feichas/features/items/data/models/default_create_response_model.dart';
import 'package:feichas/features/items/data/repositories/create_item_repository_implementation.dart';
import 'package:feichas/features/items/data/repositories/delete_item_repository_implementation.dart';
import 'package:feichas/features/items/data/repositories/get_all_items_repository_implementation.dart';
import 'package:get/get.dart';

class ListScreenController extends GetxController with StateMixin {
  final GetAllItemsRepositoryImplementation repository;
  final DeleteItemRepositoryImplementation deleteRepository;
  final CreateItemRepositoryImplementation createRepository;

  final RxList allItems = [].obs;
  final RxBool isLoading = true.obs;
  final RxBool error = false.obs;

  final RxString item = "".obs;

  ListScreenController(
      this.repository, this.deleteRepository, this.createRepository);

  @override
  void onInit() {
    getAllItems();
    super.onInit();
  }

  void setNewItem(String value) => item.value = value;

  Future<DefaultCreateResponseModel> createItem(
      Map<String, dynamic> item) async {
    return await createRepository.create(item);
  }

  Future<void> getAllItems() async {
    try {
      final DefaultResponse items = await repository.getAllItems();

      allItems.value = items.items;

      isLoading.value = false;
    } catch (e) {
      error.value = true;
    }
  }

  Future<void> deleteItem(int id) async {
    try {
      await deleteRepository.delete(id);
    } catch (e) {
      print(e);
    }
  }
}
