import 'package:flutter/material.dart';
import 'package:movie_app/src/app/features/movies/entities/entities.dart';
import 'package:movie_app/src/app/features/movies/pages/details/widgets/movie_average.dart';

class MovieHeadline extends StatelessWidget {
  final Movie movie;

  const MovieHeadline({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.releaseDateFormatted,
          style: textTheme.bodySmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            movie.title,
            style: textTheme.headlineSmall,
          ),
        ),
        MovieAverage(average: movie.averageWithPrecision)
      ],
    );
  }
}
