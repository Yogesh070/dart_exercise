import 'package:flutter/material.dart';

class FirstLayout extends StatelessWidget {
  FirstLayout({super.key});

  void printData() {
    debugPrint('printData');
  }

  final List<String> data = ['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sample App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: const Center(child: Text('Image')),
              ),
            ),
            Expanded(
              child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Container(
                          height: 60,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                const Icon(Icons.add),
                                Text(data[i]),
                              ],
                            ),
                          ),
                        ),
                    ],
                  )
                  //DONE USING MAP
                  // children: ['One', 'Two', 'Three', 'Four']
                  //     .map(
                  //       (e) => Container(
                  //         height: 60,
                  //         width: 120,
                  //         child: ElevatedButton(
                  //           onPressed: () {},
                  //           child: Column(
                  //             children: [
                  //               Icon(Icons.add),
                  //               Text(e),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //     .toList()),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
