import 'package:flutter/material.dart';
import 'package:news_app/widgets/explore.dart';
import 'package:news_app/widgets/news.dart';
import 'package:news_app/widgets/trends.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
            curve: Curves.bounceInOut,
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
            margin: EdgeInsets.zero,
            child: Center(child: Text('Customise')),
          ),
          ListTile(
            tileColor: Colors.black12,
            title: Center(
                child: Text(
              'Select County',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
          ),
        ],
      )),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        title: Text(
          "Daily News",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Theme.of(context).iconTheme.color,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Theme.of(context).iconTheme.color,
              )),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Trends(),
              SizedBox(height: 20),
              Explore(),
              SizedBox(height: 20),
              News()
            ],
          ),
        ),
      ),
    );
  }
}
