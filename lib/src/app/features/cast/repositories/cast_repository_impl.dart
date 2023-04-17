import 'package:dartz/dartz.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

import '../datasources/remote/cast_remote_data.dart';
import '../entities/actor.dart';
import '../mappers/actor_mapper.dart';
import 'cast_repostiory.dart';

class CastRepositoryImpl implements CastRepository {
  late final CastRemoteDataSource _remote;

  CastRepositoryImpl({
    required CastRemoteDataSource castRemoteDataSource,
  }) {
    _remote = castRemoteDataSource;
  }

  @override
  Future<Either<Failure, List<Actor>>> findByMovieId(int id) async {
    try {
      final data = await _remote.getCreditsByMovieId(id);
      final movies = data.cast.toDomainModel();
      return right(movies);
    } catch (e) {
      const failure = AppFailure();
      return left(failure);
    }
  }
}
