import 'package:equatable/equatable.dart';

import 'package:movie_app/src/app/features/movies/entities/movie.dart';
import 'package:movie_app/src/shared/errors/errors.dart';

class MoviesPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesPageInitialState extends MoviesPageState {}

class MoviesPageLoadingState extends MoviesPageState {}

class MoviesPageFailureState extends MoviesPageState {
  final Failure failure;

  MoviesPageFailureState({
    required this.failure,
  });

  @override
  List<Object?> get props => [failure];
}

class MoviesPageLoadedState extends MoviesPageState {
  final List<Movie> movies;
  
  MoviesPageLoadedState({
    required this.movies,
  });

  @override
  List<Object?> get props => [movies];
}
