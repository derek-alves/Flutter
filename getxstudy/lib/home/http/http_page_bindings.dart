import 'package:get/get.dart';
import 'package:getxstudy/home/http/http_page_controller.dart';
import 'package:getxstudy/home/http/repository/user_http_repository.dart';
import 'package:getxstudy/repository/i_user_repository.dart';

class HttpPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IUserRepository>(UserHttpRepository());
    Get.put(HttpPageController(Get.find()));
  }
}
