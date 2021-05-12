import 'dart:convert';

import 'package:getxstudy/model/user_type_model.dart';

class UserModel {
  String id;
  String name;
  String username;
  List<UserTypeModel> types;

  UserModel({
    required this.id,
    required this.name,
    required this.types,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      types: List<UserTypeModel>.from(
          map['types']?.map((x) => UserTypeModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
