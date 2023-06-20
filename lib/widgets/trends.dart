import 'package:flutter/material.dart';
import 'package:news_app/helper/trending_list.dart';
import 'package:news_app/models/trending_model.dart';

class Trends extends StatefulWidget {
  const Trends({
    super.key,
  });

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  List<TrendingModel> newTrends = <TrendingModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newTrends = getTrends();
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
        SizedBox(
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
                    image: newTrends[index].image!,
                    headline: newTrends[index].headline!,
                    tag: newTrends[index].tag!,
                    channel: newTrends[index].channel!,
                    channelImg: newTrends[index].channelImg!,
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class TrendingCard extends StatelessWidget {
  final String image;
  final String headline;
  final String tag;
  final String channel;
  final String channelImg;
  const TrendingCard({
    super.key,
    required this.image,
    required this.headline,
    required this.tag,
    required this.channel,
    required this.channelImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
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
                  tag,
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
              headline,
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
                    child: Image.asset(channelImg, fit: BoxFit.fill),
                  ),
                ),
                // const SizedBox(width: 20),
                Text(channel),
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
    );
  }
}
