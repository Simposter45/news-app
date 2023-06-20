import 'package:news_app/models/news_model.dart';

List<NewsModel> getNews() {
  List<NewsModel> newsList = <NewsModel>[];
  NewsModel newsModel;

  //1
  newsModel = new NewsModel();
  newsModel.image = 'assets/images/philosophy.jpg';
  newsModel.headline = '8 Steps to Help you solve overthinking';
  newsModel.category = 'Philosophy';
  newsModel.channel = 'Personal Growth';
  newsModel.channelImg = 'assets/images/philosophy.jpg';
  newsModel.date = '11.05.2002';
  newsList.add(newsModel);

  //2
  newsModel = new NewsModel();
  newsModel.image = 'assets/images/philosophy.jpg';
  newsModel.headline = '8 Steps to Help you solve overthinking';
  newsModel.category = 'Philosophy';
  newsModel.channel = 'Personal Growth';
  newsModel.channelImg = 'assets/images/philosophy.jpg';
  newsModel.date = '11.05.2002';
  newsList.add(newsModel);

  //3
  newsModel = new NewsModel();
  newsModel.image = 'assets/images/philosophy.jpg';
  newsModel.headline = '8 Steps to Help you solve overthinking';
  newsModel.category = 'Philosophy';
  newsModel.channel = 'Personal Growth';
  newsModel.channelImg = 'assets/images/philosophy.jpg';
  newsModel.date = '11.05.2002';
  newsList.add(newsModel);

  //4
  newsModel = new NewsModel();
  newsModel.image = 'assets/images/philosophy.jpg';
  newsModel.headline = '8 Steps to Help you solve overthinking';
  newsModel.category = 'Philosophy';
  newsModel.channel = 'Personal Growth';
  newsModel.channelImg = 'assets/images/philosophy.jpg';
  newsModel.date = '11.05.2002';
  newsList.add(newsModel);

  //5
  newsModel = new NewsModel();
  newsModel.image = 'assets/images/philosophy.jpg';
  newsModel.headline = '8 Steps to Help you solve overthinking';
  newsModel.category = 'Philosophy';
  newsModel.channel = 'Personal Growth';
  newsModel.channelImg = 'assets/images/philosophy.jpg';
  newsModel.date = '11.05.2002';
  newsList.add(newsModel);

  //6
  newsModel = new NewsModel();
  newsModel.image = 'assets/images/philosophy.jpg';
  newsModel.headline = '8 Steps to Help you solve overthinking';
  newsModel.category = 'Philosophy';
  newsModel.channel = 'Personal Growth';
  newsModel.channelImg = 'assets/images/philosophy.jpg';
  newsModel.date = '11.05.2002';
  newsList.add(newsModel);

  return newsList;
}
