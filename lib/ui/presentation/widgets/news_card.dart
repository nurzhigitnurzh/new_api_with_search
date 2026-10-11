import 'package:flutter/material.dart';
import 'package:home1/domain/entity/news_article_entity.dart';
import 'package:home1/ui/presentation/format_date.dart';
import 'package:home1/ui/presentation/widgets/news_image.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article, required this.onTap});

  final NewsArticleEntity article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: NewsImage(url: article.urlToImage),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            article.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black54,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            article.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            formatDate(article.publishedAt),
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}