import 'package:flutter/material.dart';
import 'package:new_flutter_project/home_page.dart';
import 'package:new_flutter_project/second_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/homepage',
      routes: {
        Homepage.homepageRoute: (context) => const Homepage(),
        SecondPage.secondPageRoute: (context) => const SecondPage(),
      },
    ),
  );
}
