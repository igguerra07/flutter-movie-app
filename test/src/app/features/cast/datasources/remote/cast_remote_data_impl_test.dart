import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/infra/api/api.dart';
import 'package:movie_app/src/app/features/cast/cast.dart';

import '../../../../../../fixtures/cast/cast_fixtures.dart';
import '../../../../../../fixtures/fixtures_reader.dart';

class ApiClientMock extends Mock implements ApiClient {}

void main() {
  late ApiClient apiClientMock;
  late CastRemoteDataSource castRemoteDataSource;

  setUp(() {
    apiClientMock = ApiClientMock();
    castRemoteDataSource = CastRemoteDataSourceImpl(
      apiClient: apiClientMock,
    );
  });

  group("CastRemoteDataSourceImpl |", () {
    group("getCreditsByMovieId |", () {
      test(
        "Should return [CastResourceModel] when receive success response",
        () async {
          const movieId = 1;
          final raw = fixture(CastFixtures.castResourceResponse);
          final json = jsonDecode(raw);
          final response = ApiResponse(
            data: json,
            statusCode: 200,
          );
          when(
            () => apiClientMock.get(path: any(named: "path")),
          ).thenAnswer((_) async => response);

          final result =
              await castRemoteDataSource.getCreditsByMovieId(movieId);

          expect(result, isA<CastResourceModel>());
          expect(result.cast.length, 79);
        },
      );

      test(
        "Should return [ApiError] when failure response",
        () async {
          const movieId = 1;
          final apiError = ApiError(
            type: ApiErrorType.response,
            statusCode: 400,
          );
          when(
            () => apiClientMock.get(path: any(named: "path")),
          ).thenThrow(apiError);

          final getTrending = castRemoteDataSource.getCreditsByMovieId;

          expect(() => getTrending(movieId), throwsA(isA<ApiError>()));
        },
      );
    });
  });
}
