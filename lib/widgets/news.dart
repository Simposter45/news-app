import 'package:flutter/material.dart';
import 'package:news_app/helper/news_list.dart';
import 'package:news_app/models/news_model.dart';

class News extends StatefulWidget {
  const News({
    super.key,
  });

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<NewsModel> newsList = <NewsModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsList = getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: NewsCard(
              category: newsList[index].category!,
              date: newsList[index].date!,
              headline: newsList[index].headline!,
              image: newsList[index].image!,
              channel: newsList[index].channel!,
              channelImg: newsList[index].channelImg!,
            ),
          );
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String category;
  final String date;
  final String headline;
  final String image;
  final String channel;
  final String channelImg;
  const NewsCard({
    super.key,
    required this.category,
    required this.date,
    required this.headline,
    required this.image,
    required this.channel,
    required this.channelImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(category),
                      SizedBox(width: 30),
                      Text(date),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    headline,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset(channelImg, fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(child: Text(channel)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            size: 20,
                            color: Theme.of(context).iconTheme.color,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                height: 130,
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
