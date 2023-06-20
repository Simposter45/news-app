import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // colorScheme: ColorScheme(
        //     background: Colors.grey.shade100,
        //     brightness: Brightness.light,
        //     primary: Colors.black),
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.black, fontSize: 24),
          bodyLarge: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              color: Colors.blueGrey,
              fontSize: 14,
              fontWeight: FontWeight.w300),
          labelMedium: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: 'Georgia',
      ),
      home: NewsApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
