/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Article extends _i1.SerializableEntity {
  Article({
    this.id,
    required this.title,
    required this.content,
    required this.publishedOn,
    required this.isPrime,
    required this.authorName,
  });

  factory Article.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Article(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      content: serializationManager
          .deserialize<String>(jsonSerialization['content']),
      publishedOn: serializationManager
          .deserialize<DateTime>(jsonSerialization['publishedOn']),
      isPrime:
          serializationManager.deserialize<bool>(jsonSerialization['isPrime']),
      authorName: serializationManager
          .deserialize<String>(jsonSerialization['authorName']),
    );
  }

  int? id;

  String title;

  String content;

  DateTime publishedOn;

  bool isPrime;

  String authorName;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'publishedOn': publishedOn,
      'isPrime': isPrime,
      'authorName': authorName,
    };
  }
}
