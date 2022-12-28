import 'package:serverpod/serverpod.dart';
import 'package:study_serverpod_server/src/generated/protocol.dart';

class ExampleEndpoint extends Endpoint {
  Future<String> hello(Session session, String name) async {
    return 'Hello $name';
  }

  Future<Article> getArticle(Session session, String id) async {
    return Article(
      title: "Flutter with serverpod",
      content: "This is test project",
      publishedOn: DateTime.now(),
      isPrime: true,
      authorName: "Derek",
    );
  }
}
