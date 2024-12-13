import 'package:flutter/material.dart';

class ScrollingWidget extends StatelessWidget {
  const ScrollingWidget({super.key});

  // Widget getWidget(BuildContext context, int index) {
  //   return Text(index.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //USING COLUMN
      // body: Column(
      //   children: [
      //     for (int i = 0; i < 100; i++) Text('Item $i'),
      //   ],
      // ),

      //USING LISTVIEW

      // body: ListView.builder(
      //   itemCount: 100,
      //   itemBuilder: (context, i) {
      //     return Text('Item $i');
      //   },
      // ),

      //USING LISTVIEW with seprated factory constructor

      /// ListView.separated(
      ///   itemCount: 25,
      ///   separatorBuilder: (BuildContext context, int index) => const Divider(),
      ///   itemBuilder: (BuildContext context, int index) {
      ///     return ListTile(
      ///       title: Text('item $index'),
      ///     );
      ///   },
      /// )
      ///
      //USING GRIDVIEW BUILDER

      body: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.all(10),
            color: Colors.blue.shade100,
            child: Text('Item $i'),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      ),
    );
  }
}
