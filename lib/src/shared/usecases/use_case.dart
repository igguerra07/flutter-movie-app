import 'package:dartz/dartz.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

abstract class UseCase<R, P> {
  Future<Either<Failure, R>> call(P params);
}
