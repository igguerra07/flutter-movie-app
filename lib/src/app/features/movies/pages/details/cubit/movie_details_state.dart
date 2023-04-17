import 'package:equatable/equatable.dart';

import 'package:movie_app/src/shared/errors/errors.dart';
import 'package:movie_app/src/app/features/cast/cast.dart';
import 'package:movie_app/src/app/features/videos/videos.dart';

import '../../../entities/movie.dart';

abstract class MovieDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsFailureState extends MovieDetailsState {
  final Failure failure;

  MovieDetailsFailureState({
    required this.failure,
  });

  @override
  List<Object?> get props => [failure];
}

class MovieDetailsLoadedState extends MovieDetailsState {
  final Movie movie;
  final List<Actor> cast;
  final List<Video> trailers;

  MovieDetailsLoadedState({
    required this.cast,
    required this.movie,
    required this.trailers,
  });

  @override
  List<Object?> get props => [movie, cast, trailers];
}
