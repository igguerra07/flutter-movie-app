import 'package:dartz/dartz.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

import '../entities/actor.dart';

abstract class CastRepository {
  Future<Either<Failure, List<Actor>>> findByMovieId(int id);
}
