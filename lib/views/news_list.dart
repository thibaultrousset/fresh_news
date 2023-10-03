import 'package:flutter/material.dart';
import 'package:fresh_news/view_models/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.articles, required this.onSelected});

  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            onTap: () {
              onSelected(article);
            },
            title: Text(article.description),
            leading: article.imageUrl != ""
                ? Image.network(article.imageUrl)
                : Image.asset("images/news_placeholder.jpeg"),
          );
        });
  }
}
