import 'dart:convert';

import 'package:news_app/models/api_model.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  List<ApiModel> apiList = <ApiModel>[];

  Future getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2023-05-18&sortBy=publishedAt&apiKey=8b4cd2ce17024c70b47044fa15905b74';

    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);

    if (data['status'] == 'ok') {
      data['articles'].forEach((element) {
        ApiModel apiModel = ApiModel(
          // sourceName: sourceName,
          author: element['author'] ?? '',
          title: element['title'] ?? '',
          description: element['description'] ?? '',
          url: element['url'] ?? '',
          urlToImage: element['urlToImage'] ?? '',
          publishedAt: element['publishedAt'] ?? '',
        );
        apiList.add(apiModel);
      });
    }
  }
}
