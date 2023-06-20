import 'package:news_app/models/trending_model.dart';

List<TrendingModel> getTrends() {
  List<TrendingModel> newTrends = <TrendingModel>[];
  TrendingModel trendingModel;

  //1
  trendingModel = new TrendingModel();
  trendingModel.image = 'assets/images/philosophy.jpg';
  trendingModel.headline = '8 Steps to Help you solve overthinking';
  trendingModel.tag = 'Philosophy';
  trendingModel.channel = 'Personal Growth';
  trendingModel.channelImg = 'assets/images/philosophy.jpg';
  newTrends.add(trendingModel);

  //2
  trendingModel = new TrendingModel();
  trendingModel.image = 'assets/images/philosophy.jpg';
  trendingModel.headline = '8 Steps to Help you solve overthinking';
  trendingModel.tag = 'Philosophy';
  trendingModel.channel = 'Personal Growth';
  trendingModel.channelImg = 'assets/images/philosophy.jpg';
  newTrends.add(trendingModel);

  //3
  trendingModel = new TrendingModel();
  trendingModel.image = 'assets/images/philosophy.jpg';
  trendingModel.headline = '8 Steps to Help you solve overthinking';
  trendingModel.tag = 'Philosophy';
  trendingModel.channel = 'Personal Growth';
  trendingModel.channelImg = 'assets/images/philosophy.jpg';
  newTrends.add(trendingModel);

  //4
  trendingModel = new TrendingModel();
  trendingModel.image = 'assets/images/philosophy.jpg';
  trendingModel.headline = '8 Steps to Help you solve overthinking';
  trendingModel.tag = 'Philosophy';
  trendingModel.channel = 'Personal Growth';
  trendingModel.channelImg = 'assets/images/philosophy.jpg';
  newTrends.add(trendingModel);

  return newTrends;
}
