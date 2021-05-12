import 'dart:convert';
import 'dart:html';

import 'package:getxstudy/model/user_model.dart';
import 'package:getxstudy/repository/i_user_repository.dart';
import 'package:http/http.dart' as http;

class UserHttpRepository implements IUserRepository {
  @override
  Future<List<UserModel>> findAllUsers() async {
    var url = Uri.https("5f7cba02834b5c0016b058aa.mockapi.io", "/api/users");
    final response = await http.get(url);

    final List<Map<String, dynamic>> responseMap = jsonDecode(response.body);
    return responseMap.map<UserModel>((resp) {}).toList();
  }
}
