import 'package:flutter/material.dart';
import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/services/web_service.dart';
import 'package:fresh_news/view_models/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  empty,
  searching,
}

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  LoadingStatus loadingStatus = LoadingStatus.searching;
  void populateTopHeadlines() async {
    loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    articles =
        newsArticles.map((e) => NewsArticleViewModel(article: e)).toList();
    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;

    notifyListeners();
  }

  void populateSearch(String filter) async {
    loadingStatus = LoadingStatus.searching;

    List<NewsArticle> newsArticles =
        await WebService().fetchHeadlinesFiltered(filter);
    articles =
        newsArticles.map((e) => NewsArticleViewModel(article: e)).toList();
    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;

    notifyListeners();
  }
}
