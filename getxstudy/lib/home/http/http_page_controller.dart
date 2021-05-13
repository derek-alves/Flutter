import 'package:get/get.dart';
import 'package:getxstudy/repository/i_user_repository.dart';

class HttpPageController extends GetxController with StateMixin {
  final IUserRepository repository;

  HttpPageController(this.repository);

  @override
  void onInit() {
    super.onInit();
    findUsers();
  }

  void findUsers() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await repository.findAllUsers();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error("Erro ao buscar o usuário"));
    }
  }
}
