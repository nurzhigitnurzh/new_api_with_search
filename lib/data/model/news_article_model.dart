import 'package:home1/domain/entity/news_article_entity.dart';

class NewsArticleModel {
  const NewsArticleModel({
    this.sourceName,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final String? sourceName;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    final source = json['source'] as Map<String, dynamic>?;

    return NewsArticleModel(
      sourceName: source?['name'] as String?,
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }

  static List<NewsArticleModel> fromJsonList(List<dynamic>? jsonList) {
    if (jsonList == null || jsonList.isEmpty) return [];

    return jsonList
        .map((e) => NewsArticleModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  NewsArticleEntity fromModelToEntity() {
    return NewsArticleEntity(
      sourceName: sourceName ?? '',
      author: author ?? 'Нету автора',
      title: title ?? '',
      description: description ?? '',
      url: url ?? '',
      urlToImage: urlToImage ?? '',
      publishedAt: publishedAt ?? '',
      content: (content ?? '').replaceAll(RegExp(r'\s?\[\+\d+ chars\]'), ''),
    );
  }
}