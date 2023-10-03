import 'dart:convert';
import 'dart:developer';

import 'package:fresh_news/models/news_article.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    var url = Uri.https('newsapi.org', 'v2/top-headlines',
        {'country': 'us', 'apiKey': 'e6975769191443819c9ba6024f5600dc'});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      log('data: $result');
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<List<NewsArticle>> fetchHeadlinesFiltered(String filter) async {
    var url = Uri.https('newsapi.org', 'v2/top-headlines', {
      'country': 'fr',
      'apiKey': 'e6975769191443819c9ba6024f5600dc',
      'q': filter
    });

    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      log('data: $result');
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
