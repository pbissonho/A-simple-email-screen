import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: HomePage()
    );
  }
}