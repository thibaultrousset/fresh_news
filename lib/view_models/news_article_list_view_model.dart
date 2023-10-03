import 'package:flutter/material.dart';
import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/services/web_service.dart';
import 'package:fresh_news/view_models/news_article_view_model.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  void populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    articles =
        newsArticles.map((e) => NewsArticleViewModel(article: e)).toList();
    notifyListeners();
  }
}
