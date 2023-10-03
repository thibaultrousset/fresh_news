import 'package:flutter/material.dart';
import 'package:fresh_news/view_models/news_article_list_view_model.dart';
import 'package:fresh_news/view_models/news_article_view_model.dart';
import 'package:fresh_news/views/news_details.dart';
import 'package:fresh_news/views/news_list.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
    super.initState();
  }

  goToNewsDetails(BuildContext context, NewsArticleViewModel article) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewsDetails(article: article)));
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return const Align(child: CircularProgressIndicator());
      case LoadingStatus.completed:
        return NewsList(
          articles: vm.articles,
          onSelected: (article) => goToNewsDetails(context, article),
        );
      case LoadingStatus.empty:
        return const Text("no results");
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Top News")),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                vm.populateSearch(value);
              },
              decoration: InputDecoration(
                  labelText: "Enter search term",
                  icon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _controller.clear();
                      },
                      icon: const Icon(Icons.clear))),
            ),
            Expanded(child: _buildList(context, vm))
          ],
        ));
  }
}
