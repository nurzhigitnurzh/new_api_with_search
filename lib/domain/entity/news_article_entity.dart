import 'package:equatable/equatable.dart';

class NewsArticleEntity extends Equatable {
  const NewsArticleEntity({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  @override
  List<Object?> get props => [
        sourceName,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}