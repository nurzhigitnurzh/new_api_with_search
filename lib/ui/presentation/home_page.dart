import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home1/core/di/injection.dart';
import 'package:home1/ui/bloc/news_bloc.dart';
import 'package:home1/ui/bloc/news_event.dart';
import 'package:home1/ui/bloc/news_state.dart';
import 'package:home1/ui/presentation/details_page.dart';
import 'package:home1/ui/presentation/widgets/news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NewsBloc>()..add(const GetNewsEvent('tesla')),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final _controller = TextEditingController();
  String _query = 'tesla';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _search() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    FocusScope.of(context).unfocus();
    setState(() => _query = text);
    context.read<NewsBloc>().add(GetNewsEvent(text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, size: 20),
                    onPressed: _search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'News',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    return switch (state) {
                      NewsInitial() || NewsLoading() =>
                        const Center(child: CircularProgressIndicator()),
                      NewsError(:final message) => Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(message, textAlign: TextAlign.center),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () => context
                                    .read<NewsBloc>()
                                    .add(GetNewsEvent(_query)),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      NewsLoaded(:final articles) => articles.isEmpty
                          ? const Center(child: Text('Ничего не найдено'))
                          : GridView.builder(
                              padding: const EdgeInsets.only(bottom: 16),
                              itemCount: articles.length + 1,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.52,
                              ),
                              itemBuilder: (context, index) {
                                if (index == articles.length) {
                                  return const Center(
                                    child: Text(
                                      'You reached the end',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                }
                                final article = articles[index];
                                return NewsCard(
                                  article: article,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          DetailsPage(article: article),
                                    ),
                                  ),
                                );
                              },
                            ),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}