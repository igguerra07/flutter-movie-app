import 'package:dartz/dartz.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

import '../datasources/videos_remote_data.dart';
import '../mappers/video_mapper.dart';
import '../entities/video.dart';
import 'videos_repository.dart';

class VideosRepositoryImpl implements VideosRepository {
  late final VideosRemoteDataSource _remote;

  VideosRepositoryImpl({
    required VideosRemoteDataSource videosRemoteDataSource,
  }) {
    _remote = videosRemoteDataSource;
  }

  @override
  Future<Either<Failure, List<Video>>> findManyByMovieId(int id) async {
    try {
      final data = await _remote.getTrailesByMovieId(id);
      final videos = data.results.toDomainModel();
      return right(videos);
    } catch (e) {
      const failure = AppFailure();
      return left(failure);
    }
  }
}
