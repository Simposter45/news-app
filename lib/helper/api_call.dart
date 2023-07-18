import 'dart:convert';

import 'package:news_app/models/api_model.dart';
import 'package:http/http.dart' as http;

class TrendNews {
  List<ApiModel> apiList = <ApiModel>[];

  Future<void> getNews(String category) async {
    String url;

    if (category == "") {
      url =
          'https://newsapi.org/v2/top-headlines?country=in&sortBy=popularity&apiKey=8b4cd2ce17024c70b47044fa15905b74';
    } else {
      url =
          'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=8b4cd2ce17024c70b47044fa15905b74';
    }

    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);

    if (data['status'] == 'ok') {
      data['articles'].forEach((element) {
        ApiModel apiModel = ApiModel(
          sourceName: element['source']['name'] ?? '',
          author: element['author'] ?? '',
          title: element['title'] ?? '',
          description: element['description'] ?? '',
          url: element['url'] ?? '',
          urlToImage: element['urlToImage'] ?? '',
          publishedAt: element['publishedAt'] ?? '',
          content: element['content'] ?? '',
          category: element['category'] ?? '',
        );

        if (element['urlToImage'] != null && element['url'] != null) {
          apiList.add(apiModel);
        }
      });
    }
  }
}
