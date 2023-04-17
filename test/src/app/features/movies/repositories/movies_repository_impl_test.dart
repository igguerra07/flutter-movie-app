import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/infra/api/api.dart';
import 'package:movie_app/src/shared/errors/errors.dart';
import 'package:movie_app/src/app/features/movies/movies.dart';

class MoviesRemoteDataSourceMock extends Mock
    implements MoviesRemoteDataSource {}

void main() {
  late MoviesRemoteDataSource moviesRemoteDataSourceMock;
  late MoviesRepository moviesRepository;

  setUp(() {
    moviesRemoteDataSourceMock = MoviesRemoteDataSourceMock();
    moviesRepository = MoviesRepositoryImpl(
      moviesRemoteDataSource: moviesRemoteDataSourceMock,
    );
  });

  group('MoviesRepositoryImpl |', () {
    group('getTrending |', () {
      test(
        "Should return [List<Movie>] when to be able get trending movies",
        () async {
          const movies = <MovieModel>[];
          final moviesResource = MoviesResourceModel(
            page: 1,
            results: movies,
            totalPages: 1,
            totalResults: 0,
          );
          when(() => moviesRemoteDataSourceMock.getTrending())
              .thenAnswer((_) async => moviesResource);

          final result = await moviesRepository.getTrending();

          expect(result.fold(id, id), isA<List<Movie>>());
        },
      );

      test(
        "Should return [Failure] when not be able get trending movies",
        () async {
          const failure = AppFailure();
          when(() => moviesRemoteDataSourceMock.getTrending())
              .thenThrow(ApiError());

          final result = await moviesRepository.getTrending();

          expect(result, left(failure));
        },
      );
    });
    group('search |', () {
      test(
        "Should return [List<Movie>] when to be able get search movies",
        () async {
          const query = "movie";
          const movies = <MovieModel>[];
          final moviesResource = MoviesResourceModel(
            page: 1,
            results: movies,
            totalPages: 1,
            totalResults: 0,
          );
          when(() => moviesRemoteDataSourceMock.search(query: query))
              .thenAnswer((_) async => moviesResource);

          final result = await moviesRepository.search(query: query);

          expect(result.fold(id, id), isA<List<Movie>>());
          verify(() => moviesRemoteDataSourceMock.search(query: query))
              .called(1);
        },
      );

      test(
        "Should return [Failure] when not be able get search movies",
        () async {
          const failure = AppFailure();
          when(() => moviesRemoteDataSourceMock.search(query: ""))
              .thenThrow(ApiError());

          final result = await moviesRepository.search();

          expect(result, left(failure));
        },
      );
    });
  });
}
