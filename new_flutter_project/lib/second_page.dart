import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Second Page '),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
