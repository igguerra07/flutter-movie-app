import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/infra/api/api.dart';
import 'package:movie_app/src/shared/errors/errors.dart';
import 'package:movie_app/src/app/features/cast/cast.dart';

class CastRemoteDataSourceMock extends Mock implements CastRemoteDataSource {}

void main() {
  late CastRemoteDataSource castRemoteDataSourceMock;
  late CastRepository castRepository;

  setUp(() {
    castRemoteDataSourceMock = CastRemoteDataSourceMock();
    castRepository = CastRepositoryImpl(
      castRemoteDataSource: castRemoteDataSourceMock,
    );
  });

  group('CastRepositoryImpl |', () {
    group('findByMovieId |', () {
      test(
        "Should return [List<Actor>] when to be able get movie cast",
        () async {
          const movieId = 1;
          const cast = <ActorModel>[];
          final castResource = CastResourceModel(
            id: 1,
            cast: cast,
          );
          when(() => castRemoteDataSourceMock.getCreditsByMovieId(movieId))
              .thenAnswer((_) async => castResource);

          final result = await castRepository.findByMovieId(movieId);

          expect(result.fold(id, id), isA<List<Actor>>());
          verify(() => castRemoteDataSourceMock.getCreditsByMovieId(movieId))
              .called(1);
        },
      );

      test(
        "Should return [Failure] when not be able get movie cast",
        () async {
          const movieId = 1;
          const failure = AppFailure();
          when(() => castRemoteDataSourceMock.getCreditsByMovieId(movieId))
              .thenThrow(ApiError());

          final result = await castRepository.findByMovieId(movieId);

          expect(result, left(failure));
        },
      );
    });
  });
}
