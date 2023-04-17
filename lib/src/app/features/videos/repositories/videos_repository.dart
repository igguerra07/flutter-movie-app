import 'package:dartz/dartz.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

import '../entities/video.dart';

abstract class VideosRepository {
  Future<Either<Failure, List<Video>>> findManyByMovieId(int id);
}
