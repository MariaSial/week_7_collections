import 'package:flutter/material.dart';
import 'package:week_7_task/home_screen.dart';

// import 'package:week_7_task/home_screen_navigation.dart';

void main() => runApp(CollectionsApp());

class CollectionsApp extends StatelessWidget {
  const CollectionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collections',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
      // home: HomeScreenNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
