import 'package:flutter/material.dart';
import 'package:new_flutter_project/data.dart';

class DetailsPage extends StatelessWidget {
  final String movieId;

  const DetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          int.tryParse(movieId) == null
              ? 'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
              : images[int.parse(movieId)],
          height: 400,
          width: 400,
        ),
      ),
    );
  }
}
