// coverage:ignore-file
import 'package:flutter/material.dart';

import 'package:movie_app/src/app/features/movies/pages/pages.dart';
import 'package:movie_app/src/app/features/videos/pages/pages.dart';

import 'routes.dart';

class RoutesGenerator {
  static Map<String, dynamic> _buildRoutes(RouteSettings settings) {
    return {
      RoutesConstants.initial: (context) => const MoviesPage(),
      RoutesConstants.movie: (context) => MovieDetailsPage(
            params: settings.arguments as MovieDetailsPageParams,
          ),
      RoutesConstants.trailers: (context) => VideoPage(
            params: settings.arguments as VideoPageParams,
          ),
    };
  }

  static Route? generate(RouteSettings settings) {
    final routes = _buildRoutes(settings);
    final buildPages = routes[settings.name];
    if (buildPages == null) return null;

    return PageRouteBuilder(
      pageBuilder: (context, __, ___) => buildPages(context),
      transitionsBuilder: _buildTransition,
    );
  }

  static Widget _buildTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
