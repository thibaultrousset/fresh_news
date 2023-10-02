import 'dart:convert';

import 'package:fresh_news/models/news_article.dart';
import 'package:http/http.dart' as http;

class WebService {
  fetchTopHeadlines() async {
    Uri url = Uri.http(
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=e6975769191443819c9ba6024f5600dc");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
