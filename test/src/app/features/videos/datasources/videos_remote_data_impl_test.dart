import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/infra/api/api.dart';
import 'package:movie_app/src/app/features/videos/videos.dart';

import '../../../../../fixtures/fixtures_reader.dart';
import '../../../../../fixtures/videos/videos_fixtures.dart';

class ApiClientMock extends Mock implements ApiClient {}

void main() {
  late ApiClient apiClientMock;
  late VideosRemoteDataSource videosRemoteDataSource;

  setUp(() {
    apiClientMock = ApiClientMock();
    videosRemoteDataSource = VideosRemoteDataSourceImpl(
      resource: "",
      apiClient: apiClientMock,
    );
  });

  group("VideosRemoteDataSourceImpl |", () {
    group("getTrailesByMovieId |", () {
      test(
        "Should return [VideosResourceModel] when receive success response",
        () async {
          const movieId = 1;
          final raw = fixture(VideosFixtures.videosResourceResponse);
          final json = jsonDecode(raw);
          final response = ApiResponse(
            data: json,
            statusCode: 200,
          );
          when(
            () => apiClientMock.get(path: any(named: "path")),
          ).thenAnswer((_) async => response);

          final result = await videosRemoteDataSource.getTrailesByMovieId(
            movieId,
          );

          expect(result, isA<VideosResourceModel>());
          expect(result.results.length, 2);
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

          final getTrending = videosRemoteDataSource.getTrailesByMovieId;

          expect(() => getTrending(movieId), throwsA(isA<ApiError>()));
        },
      );
    });
  });
}
