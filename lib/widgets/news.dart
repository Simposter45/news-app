import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/category_list.dart';
import 'package:news_app/helper/news_list.dart';
import 'package:news_app/helper/api_call.dart';
import 'package:news_app/models/api_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/webpage_screen.dart';

class News extends StatefulWidget {
  const News({
    super.key,
  });

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<ApiModel> newsList = <ApiModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsList();
  }

  Future<void> getNewsList() async {
    TrendNews newsClass = TrendNews();

    await newsClass.getNews("");
    setState(() {
      newsList = newsClass.apiList;
    });
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
              date: newsList[index].publishedAt!,
              headline: newsList[index].title!,
              image: newsList[index].urlToImage!,
              channel: newsList[index].sourceName!,
              channelImg: newsList[index].urlToImage!,
              url: newsList[index].url!,
            ),
          );
        },
      ),
    );
  }
}

class NewsCard extends StatefulWidget {
  final String category;
  final String date;
  final String headline;
  final String image;
  final String channel;
  final String channelImg;
  final String url;
  const NewsCard({
    super.key,
    required this.category,
    required this.date,
    required this.headline,
    required this.image,
    required this.channel,
    required this.channelImg,
    required this.url,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebPageScreen(url: widget.url))),
      child: Container(
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
                        Text(widget.date.substring(11, 19)),
                        // SizedBox(width: 30),
                        Text(widget.date.substring(0, 10)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.headline.length > 25
                          ? "${widget.headline.substring(0, 25)}..."
                          : widget.headline,
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
                            child: Image(
                                image: NetworkImage(widget.channelImg),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                            child: Text(
                          widget.channel.length > 12
                              ? "${widget.channel.substring(0, 12)}..."
                              : widget.channel,
                        )),
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
                child: Image.network(
                  height: 130,
                  widget.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
