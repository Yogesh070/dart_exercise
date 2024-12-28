import 'package:flutter/material.dart';
import 'package:new_flutter_project/router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: router,
      // initialRoute: '/homepage',
      // routes: {
      //   '/home': (context) => const Homepage(),
      //   SecondPage.secondPageRoute: (context) => const SecondPage(),
      // },
    ),
  );
}
