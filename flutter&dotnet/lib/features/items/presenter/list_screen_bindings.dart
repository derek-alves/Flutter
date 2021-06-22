import 'package:feichas/core/clientHttp/getx_client_http.dart';
import 'package:feichas/features/items/data/datasource/get_all_items_datasource_implementation.dart';
import 'package:feichas/features/items/data/repositories/get_all_items_repository_implementation.dart';
import 'package:feichas/features/items/presenter/list_screen_controller.dart';
import 'package:get/get.dart';

class ListScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GetxClientHttp());
    Get.put(GetAllItemsDatasourceImplementation(Get.find()));
    Get.put(GetAllItemsRepositoryImplementation(Get.find()));
    Get.put(ListScreenController(Get.find()));
  }
}
