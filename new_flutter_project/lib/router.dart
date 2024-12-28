import 'package:go_router/go_router.dart';
import 'package:new_flutter_project/details_page.dart';
import 'package:new_flutter_project/home_page.dart';
import 'package:new_flutter_project/second_page.dart';

// /home -> Homepage
// /home/details -> detailspage

final GoRouter router = GoRouter(
  initialLocation: '/movies',
  routes: [
    GoRoute(
      path: '/movies',
      routes: [
        GoRoute(
          name: 'movie-details',
          path: ':movieId',
          redirect: (context, state) {
            final movieId = state.pathParameters['movieId'];
            if (movieId == null) {
              return '/home';
            }
            return null;
          },
          builder: (context, state) {
            final movieId = state.pathParameters['movieId'];
            return DetailsPage(
              movieId: movieId ?? '',
            );
          },
        ),
      ],
      builder: (context, state) => const Homepage(),
    ),
    GoRoute(
      name: 'second-page',
      path: '/second',
      builder: (context, state) => const SecondPage(),
    ),
  ],
);
