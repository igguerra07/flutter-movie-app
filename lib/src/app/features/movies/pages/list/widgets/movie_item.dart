import 'package:flutter/material.dart';

import '../../../entities/movie.dart';
import 'movie_poster.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviePoster(posterUrl: movie.posterUrl),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    movie.title,
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    maxLines: 4,
                    movie.overview,
                    style: textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
