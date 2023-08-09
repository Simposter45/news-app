import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/helper/api_call.dart';
import 'package:news_app/helper/category_list.dart';

import 'package:news_app/models/api_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/webpage_screen.dart';

class Trends extends StatefulWidget {
  const Trends({
    super.key,
  });

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  List<ApiModel> newTrends = <ApiModel>[];
  List<CategoryModel> categories = <CategoryModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    fetchTrendingNews().then((trendingNews) {
      setState(() {
        newTrends = trendingNews;
        _loading = false;
      });
    });
  }

  Future<List<ApiModel>> fetchTrendingNews() async {
    TrendNews newsClass = TrendNews();
    List<ApiModel> trends = [];

    for (CategoryModel category in categories) {
      await newsClass.getNews(category.categoryName!);
      if (newsClass.apiList.isNotEmpty) {
        trends.add(newsClass.apiList.first);
      }
      newsClass.apiList.clear();
    }

    return trends;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hottest News",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "See More",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 20),
        FutureBuilder<List<ApiModel>>(
          future: fetchTrendingNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              newTrends = snapshot.data ?? [];
              return SizedBox(
                height: 380,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: newTrends.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TrendingCard(
                        image: newTrends[index].urlToImage!,
                        headline: newTrends[index].title!,
                        tag: categories[index].categoryName!,
                        channel: newTrends[index].sourceName!,
                        channelImg: categories[index].imageURl!,
                        url: newTrends[index].url!,
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class TrendingCard extends StatefulWidget {
  final String image;
  final String headline;
  final String tag;
  final String channel;
  final String channelImg;
  final String url;
  const TrendingCard({
    super.key,
    required this.image,
    required this.headline,
    required this.tag,
    required this.channel,
    required this.channelImg,
    required this.url,
  });

  @override
  State<TrendingCard> createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
  Timer? timer;
  int _start = 1;

  bool showImage = false;
  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            showImage = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebPageScreen(url: widget.url)));
      },
      child: Container(
        height: 200,
        width: 300,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
          // border: Border.all(color: Colors.black, width: 5),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    child: showImage == false
                        ? Placeholder(
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade400),
                              height: 180,
                            ),
                          )
                        : Image.network(
                            widget.image,
                            // placeholder: (context, url) => CircularProgressIndicator(),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.tag,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "🔥 Trending no. 1",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "2 days ago",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.headline.length > 32
                    ? "${widget.headline.substring(0, 32)}..."
                    : widget.headline,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            // const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Image.network(widget.channelImg, fit: BoxFit.fill),
                    ),
                  ),
                  // const SizedBox(width: 20),
                  Text(widget.channel.length > 20
                      ? widget.channel.substring(0, 20)
                      : widget.channel),
                  const SizedBox(width: 40),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        size: 20,
                        color: Theme.of(context).iconTheme.color,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
