import 'dart:convert';

class UserTypeModel {
  String id;
  String name;

  UserTypeModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory UserTypeModel.fromMap(Map<String, dynamic> map) {
    return UserTypeModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTypeModel.fromJson(String source) =>
      UserTypeModel.fromMap(json.decode(source));
}
