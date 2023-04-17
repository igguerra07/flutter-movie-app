import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/infra/api/api.dart';
import 'package:movie_app/src/shared/errors/errors.dart';
import 'package:movie_app/src/app/features/videos/videos.dart';

class VideosRemoteDataSourceMock extends Mock implements VideosRemoteDataSource {}

void main() {
  late VideosRemoteDataSource videosRemoteDataSourceMock;
  late VideosRepository videosRepository;

  setUp(() {
    videosRemoteDataSourceMock = VideosRemoteDataSourceMock();
    videosRepository = VideosRepositoryImpl(
      videosRemoteDataSource: videosRemoteDataSourceMock,
    );
  });

  group('VideosRepositoryImpl |', () {
    group('findByMovieId |', () {
      test(
        "Should return [List<Video>] when to be able get movie trailers",
        () async {
          const movieId = 1;
          const videos = <VideoModel>[];
          final videosResource = VideosResourceModel(
            id: 1,
            results: videos
          );
          when(() => videosRemoteDataSourceMock.getTrailesByMovieId(movieId))
              .thenAnswer((_) async => videosResource);

          final result = await videosRepository.findManyByMovieId(movieId);

          expect(result.fold(id, id), isA<List<Video>>());
          verify(() => videosRemoteDataSourceMock.getTrailesByMovieId(movieId))
              .called(1);
        },
      );

      test(
        "Should return [Failure] when not be able get movie trailes",
        () async {
          const movieId = 1;
          const failure = AppFailure();
          when(() => videosRemoteDataSourceMock.getTrailesByMovieId(movieId))
              .thenThrow(ApiError());

          final result = await videosRepository.findManyByMovieId(movieId);

          expect(result, left(failure));
        },
      );
    });
  });
}
