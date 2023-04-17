import 'package:equatable/equatable.dart';

import 'package:movie_app/src/app/extensions/date_time_extensions.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double popularity;
  final double voteAverage;
  final String releaseDate;
  final String backdropPath;

  String get posterUrl => 'https://image.tmdb.org/t/p/w500/$posterPath';

  String get backdropUrl => 'https://image.tmdb.org/t/p/w500/$backdropPath';

  String get releaseDateFormatted => releaseDate.toDateFormat();

  String get averageWithPrecision => voteAverage.toStringAsPrecision(2);

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.voteAverage,
    required this.releaseDate,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [id, title, posterPath, backdropPath, voteAverage];
}
