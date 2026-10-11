import 'package:dio/dio.dart';
import 'package:home1/data/model/news_article_model.dart';
import 'package:home1/data/remote/api/news_data_source.dart';

abstract final class _ApiPath {
  static const String apiKey = '8d5c10496ef24e55b326ef3524c1faf3';
  static const String everything =
      'https://newsapi.org/v2/everything?q=tesla&from=2026-09-11&sortBy=publishedAt&apiKey=$apiKey';
}

class NewsDataSourceImpl implements NewsDataSource {
  const NewsDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<NewsArticleModel>> getEverything() async {
    try {
      final response = await dio.get(_ApiPath.everything);
      return NewsArticleModel.fromJsonList(response.data['articles']);
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? (data['message'] as String? ?? 'Server error')
          : (e.message ?? 'Server error');
      throw Exception(message);
    }
  }
}