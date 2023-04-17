import 'package:equatable/equatable.dart';

import 'package:movie_app/src/app/features/movies/entities/movie.dart';
import 'package:movie_app/src/shared/errors/errors.dart';

abstract class MovieSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieSearchInitialState extends MovieSearchState {}

class MovieSearchLoadingState extends MovieSearchState {}

class MovieSearchEmptyState extends MovieSearchState {
  final String query;
  
  MovieSearchEmptyState({
    required this.query,
  });
  
  @override
  List<Object?> get props => [query];
}

class MovieSearchFailureState extends MovieSearchState {
  final Failure failure;

  MovieSearchFailureState({
    required this.failure,
  });

  @override
  List<Object?> get props => [failure];
}

class MovieSearchLoadedState extends MovieSearchState {
  final List<Movie> movies;

  MovieSearchLoadedState({
    required this.movies,
  });

  @override
  List<Object?> get props => [movies];
}
