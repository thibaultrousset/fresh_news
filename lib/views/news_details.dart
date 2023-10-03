import 'package:flutter/material.dart';
import 'package:fresh_news/view_models/news_article_view_model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.article});

  final NewsArticleViewModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Center(child: Text(article.description)),
    );
  }
}
