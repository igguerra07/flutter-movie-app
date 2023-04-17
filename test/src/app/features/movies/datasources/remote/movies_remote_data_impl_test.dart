import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/infra/api/api.dart';
import 'package:movie_app/src/app/features/movies/movies.dart';

import '../../../../../../fixtures/fixtures_reader.dart';
import '../../../../../../fixtures/movies/movies_fixtures.dart';

class ApiClientMock extends Mock implements ApiClient {}

void main() {
  late ApiClient apiClientMock;
  late MoviesRemoteDataSource moviesRemoteDataSource;

  setUp(() {
    apiClientMock = ApiClientMock();
    moviesRemoteDataSource = MoviesRemoteDataSourceImpl(
      apiClient: apiClientMock,
    );
  });

  group("MoviesRemoteDataSourceImpl |", () {
    group("getTrending |", () {
      test(
        "Should return [MoviesResourceModel] when receive success response",
        () async {
          final raw = fixture(MoviesFixtures.getTreandingResponse);
          final json = jsonDecode(raw);
          final response = ApiResponse(
            data: json,
            statusCode: 200,
          );
          when(
            () => apiClientMock.get(
              path: any(named: "path"),
              queryParams: any(named: "queryParams"),
            ),
          ).thenAnswer((_) async => response);

          final result = await moviesRemoteDataSource.getTrending();

          expect(result, isA<MoviesResourceModel>());
          expect(result.results.length, 20);
        },
      );

      test(
        "Should return [ApiError] when failure response",
        () async {
          final apiError = ApiError(
            type: ApiErrorType.response,
            statusCode: 400,
          );
          when(
            () => apiClientMock.get(
              path: any(named: "path"),
              queryParams: any(named: "queryParams"),
            ),
          ).thenThrow(apiError);

          final getTrending = moviesRemoteDataSource.getTrending;

          expect(() => getTrending(), throwsA(isA<ApiError>()));
        },
      );
    });

    group("search |", () {
      test(
        "Should return [MoviesResourceModel] when receive success response",
        () async {
          final raw = fixture(MoviesFixtures.search);
          final json = jsonDecode(raw);
          final response = ApiResponse(
            data: json,
            statusCode: 200,
          );
          when(
            () => apiClientMock.get(
              path: any(named: "path"),
              queryParams: any(named: "queryParams"),
            ),
          ).thenAnswer((_) async => response);

          final result = await moviesRemoteDataSource.search(query: "");

          expect(result, isA<MoviesResourceModel>());
          expect(result.results.length, 20);
        },
      );

      test(
        "Should return [ApiError] when failure response",
        () async {
          final apiError = ApiError(
            type: ApiErrorType.response,
            statusCode: 400,
          );
          when(
            () => apiClientMock.get(
              path: any(named: "path"),
              queryParams: any(named: "queryParams"),
            ),
          ).thenThrow(apiError);

          final search = moviesRemoteDataSource.search;

          expect(() => search(query: ""), throwsA(isA<ApiError>()));
        },
      );
    });
  });
}
