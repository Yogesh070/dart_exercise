import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:new_flutter_project/widgets/rating_card.dart';

class DemoWidget extends StatelessWidget {
  const DemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        // Adding image as assets
        Image.asset(
          'assets/images/mandala.jpg',
          fit: BoxFit.cover,
        ),
        // SvgPicture.asset(
        //   'assets/images/alien.svg',
        //   height: 200,
        //   width: 200,
        // ),
        Container(
          padding: const EdgeInsets.all(24.0),
          child: const Column(
            children: [
              RatingCard(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Call'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Call'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Call'),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              )
            ],
          ),
        )
      ],
    ));
  }
}
