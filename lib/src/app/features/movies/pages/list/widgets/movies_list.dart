import 'package:flutter/material.dart';

import '../../../entities/movie.dart';
import 'movie_item.dart';

typedef OnRefresh = Future Function()?;
typedef OnMovieTap = void Function(Movie)?;

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  final OnRefresh onRefresh;
  final OnMovieTap onMovieTap;

  const MoviesList({
    Key? key,
    required this.movies,
    this.onRefresh,
    this.onMovieTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh?.call(),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: movies.length,
        itemBuilder: (_, index) => InkWell(
          onTap: () => onMovieTap?.call(movies[index]),
          child: MovieItem(movie: movies[index]),
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 6),
      ),
    );
  }
}
