import 'package:home1/data/model/news_article_model.dart';

abstract interface class NewsDataSource {
  Future<List<NewsArticleModel>> getEverything(String query);
}