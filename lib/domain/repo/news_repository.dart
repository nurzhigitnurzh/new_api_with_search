import 'package:home1/domain/entity/news_article_entity.dart';

abstract interface class NewsRepository {
  Future<List<NewsArticleEntity>> getEverythingArticles(String query);
}