import 'package:dartz/dartz.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

import '../datasources/remote/remote.dart';
import '../mappers/movie_mapper.dart';
import '../entities/movie.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  late final MoviesRemoteDataSource _remote;

  MoviesRepositoryImpl({
    required MoviesRemoteDataSource moviesRemoteDataSource,
  }) {
    _remote = moviesRemoteDataSource;
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrending() async {
    try {
      final data = await _remote.getTrending();
      final movies = data.results.toDomainModel();
      return right(movies);
    } catch (e) {
      const failure = AppFailure();
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> search({
    String query = "",
  }) async {
    try {
      final data = await _remote.search(query: query);
      final movies = data.results.toDomainModel();
      return right(movies);
    } catch (e) {
      const failure = AppFailure();
      return left(failure);
    }
  }
}
