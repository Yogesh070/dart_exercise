import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Oceschen Lake Campground',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text('Kananaskis, Alberta'),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            SizedBox(
              width: 4,
            ),
            Text('41'),
          ],
        )
      ],
    );
  }
}
