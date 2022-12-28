import 'package:serverpod/serverpod.dart';

import '../generated/article_class.dart';

class ArticleEndpoint extends Endpoint {
  Future<List<Article>> getArticle(Session session, {String? keyword}) async {
    return await Article.find(
      session,
      where: (t) =>
          keyword != null ? t.title.like('%$keyword%') : Constant(true),
    );
  }

  Future<bool> addArticle(Session session, Article article) async {
    await Article.insert(session, article);
    return true;
  }

  Future<bool> deleteArticle(Session session, int id) async {
    await Article.delete(
      session,
      where: (article) => article.id.equals(id),
    );
    return true;
  }
}
