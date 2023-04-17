import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/app/features/cast/cast.dart';
import 'package:movie_app/src/app/features/videos/videos.dart';
import 'package:movie_app/src/app/features/movies/movies.dart';
import 'package:movie_app/src/shared/errors/failures/app_failure.dart';

class CastRepositoryMock extends Mock implements CastRepository {}

class VideosRepositoryMock extends Mock implements VideosRepository {}

void main() {
  late CastRepository castRepositoryMock;
  late VideosRepository videosRepositoryMock;
  late GetMovieDetailsUseCase getMovieDetailsUseCase;

  setUp(() {
    castRepositoryMock = CastRepositoryMock();
    videosRepositoryMock = VideosRepositoryMock();
    getMovieDetailsUseCase = GetMovieDetailsUseCase(
      castRepository: castRepositoryMock,
      videosRepository: videosRepositoryMock,
    );
  });

  group('GetMovieDetailsUseCase |', () {
    test(
      "Should return [GetMovieDetailsUseCaseResult] when to be able get movies details",
      () async {
        const movieId = 1;
        final cast = <Actor>[];
        final trailers = <Video>[];
        const movie = Movie(
          id: movieId,
          overview: "",
          backdropPath: "",
          popularity: 0.0,
          posterPath: "",
          releaseDate: "",
          title: "",
          voteAverage: 0.0,
        );
        final result = GetMovieDetailsUseCaseResult(
          cast: cast,
          movie: movie,
          videos: trailers,
        );
        when(() => castRepositoryMock.findByMovieId(movieId))
            .thenAnswer((_) async => right(cast));
        when(() => videosRepositoryMock.findManyByMovieId(movieId))
            .thenAnswer((_) async => right(trailers));

        const params = GetMovieDetailsUseCaseParams(movie: movie);
        final eitherResult = await getMovieDetailsUseCase(params);

        expect(eitherResult, right(result));
        verify(() => castRepositoryMock.findByMovieId(movieId)).called(1);
        verify(() => videosRepositoryMock.findManyByMovieId(movieId)).called(1);
      },
    );

    test(
      "Should return [Failure] when to be able get movie cast",
      () async {
        const failure = AppFailure();
        const movieId = 1;
        const movie = Movie(
          id: movieId,
          overview: "",
          backdropPath: "",
          popularity: 0.0,
          posterPath: "",
          releaseDate: "",
          title: "",
          voteAverage: 0.0,
        );
        when(() => castRepositoryMock.findByMovieId(movieId))
            .thenAnswer((_) async => left(failure));

        const params = GetMovieDetailsUseCaseParams(movie: movie);
        final eitherResult = await getMovieDetailsUseCase(params);

        expect(eitherResult, left(failure));
        verify(() => castRepositoryMock.findByMovieId(movieId)).called(1);
        verifyNever(() => videosRepositoryMock.findManyByMovieId(movieId));
      },
    );

    test(
      "Should return [Failure] when to be able get movie trailers",
      () async {
        const failure = AppFailure();
        const movieId = 1;
        final cast = <Actor>[];
        const movie = Movie(
          id: movieId,
          overview: "",
          backdropPath: "",
          popularity: 0.0,
          posterPath: "",
          releaseDate: "",
          title: "",
          voteAverage: 0.0,
        );
        when(() => castRepositoryMock.findByMovieId(movieId))
            .thenAnswer((_) async => right(cast));
        when(() => videosRepositoryMock.findManyByMovieId(movieId))
            .thenAnswer((_) async => left(failure));

        const params = GetMovieDetailsUseCaseParams(movie: movie);
        final eitherResult = await getMovieDetailsUseCase(params);

        expect(eitherResult, left(failure));
        verify(() => castRepositoryMock.findByMovieId(movieId)).called(1);
        verify(() => videosRepositoryMock.findManyByMovieId(movieId)).called(1);
      },
    );
  });
}
