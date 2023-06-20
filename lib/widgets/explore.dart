import 'package:flutter/material.dart';
import 'package:news_app/helper/explore_list.dart';
import 'package:news_app/models/explore_model.dart';

class Explore extends StatefulWidget {
  const Explore({
    super.key,
  });

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<ExploreModel> categories = <ExploreModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "See More",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ExploreCard(
                  image: categories[index].image!,
                  text: categories[index].text!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ExploreCard extends StatelessWidget {
  final String image;
  final String text;
  const ExploreCard({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
            image,
          ),
        ),
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.black26,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
