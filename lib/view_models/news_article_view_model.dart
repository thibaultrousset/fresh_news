import 'package:fresh_news/models/news_article.dart';

class NewsArticleViewModel {
  final NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title ?? "";
  }

  String get description {
    return _newsArticle.description ?? "";
  }

  String get url {
    return _newsArticle.url ?? "";
  }

  String get imageUrl {
    return _newsArticle.urlToImage ?? "";
  }
}
