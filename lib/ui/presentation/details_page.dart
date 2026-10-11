import 'package:flutter/material.dart';
import 'package:home1/domain/entity/news_article_entity.dart';
import 'package:home1/ui/presentation/format_date.dart';
import 'package:home1/ui/presentation/widgets/news_image.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.article});

  final NewsArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 200,
                      height: 260,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: NewsImage(url: article.urlToImage),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      article.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      article.author,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _InfoBlock(label: 'Source', value: article.sourceName),
                        _InfoBlock(
                          label: 'Published',
                          value: formatDate(article.publishedAt),
                        ),
                        _InfoBlock(
                          label: 'Time',
                          value: formatTime(article.publishedAt),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        article.description,
                        style: const TextStyle(fontSize: 13, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        article.content,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        article.url,
                        style: const TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}