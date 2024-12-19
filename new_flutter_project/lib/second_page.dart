import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const secondPageRoute = '/secondPage';

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Second Page $index'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
