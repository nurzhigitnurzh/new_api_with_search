import 'package:home1/data/remote/api/news_data_source.dart';
import 'package:home1/domain/entity/news_article_entity.dart';
import 'package:home1/domain/repo/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl({required this.dataSource});

  final NewsDataSource dataSource;

  @override
  Future<List<NewsArticleEntity>> getEverythingArticles() async {
    final models = await dataSource.getEverything();
    return models.map((e) => e.fromModelToEntity()).toList();
  }
}