import 'package:dartz/dartz.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

import '../entities/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getTrending();
  Future<Either<Failure, List<Movie>>> search({String query});
}
