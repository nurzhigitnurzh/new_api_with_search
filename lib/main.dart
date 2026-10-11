import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home1/data/remote/impl/news_data_source_impl.dart';
import 'package:home1/data/repo_impl/news_repository_impl.dart';
import 'package:home1/domain/repo/news_repository.dart';
import 'package:home1/ui/presentation/home_page.dart';

void main() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  final NewsRepository repository = NewsRepositoryImpl(
    dataSource: NewsDataSourceImpl(dio: dio),
  );

  runApp(
    RepositoryProvider<NewsRepository>.value(
      value: repository,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const HomePage(),
    );
  }
}