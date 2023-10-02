import 'package:flutter/material.dart';
import 'package:fresh_news/view_models/news_article_List_view_model.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Top News")),
      body: ListView.builder(
          itemCount: vm.articles.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(vm.articles[index].description));
          }),
    );
  }
}
