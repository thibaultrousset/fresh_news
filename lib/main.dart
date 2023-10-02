import 'package:flutter/material.dart';
import 'package:fresh_news/view_models/news_article_list_view_model.dart';
import 'package:fresh_news/views/news_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh news',
      home: ChangeNotifierProvider(
          create: (context) => NewsArticleListViewModel(),
          child: const HomePage(title: 'Latest news')),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const NewsListView();
  }
}
