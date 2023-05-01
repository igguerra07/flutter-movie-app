import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/app/features/videos/videos.dart';

import '../../../../../fixtures/fixtures_reader.dart';
import '../../../../../fixtures/videos/videos_fixtures.dart';

void main() {
  group("VideosResourceModel |", () {
    group("FromJson", () {
      test(
        "Should return [VideosResourceModel] when to able get model from JSON",
        () {
          final raw = fixture(VideosFixtures.videosResourceResponse);
          final json = jsonDecode(raw);

          final result = VideosResourceModel.fromJson(json);

          expect(result, isA<VideosResourceModel>());
        },
      );
    });

    group("toJson", () {
      test(
        "Should return [Map<String, dynamic] when to able parse to JSON",
        () {
          final raw = fixture(VideosFixtures.videosResourceResponse);
          final json = jsonDecode(raw);
          final resource = VideosResourceModel.fromJson(json);

          final result = resource.toJson();

          expect(result, isA<Map<String, dynamic>>());
          expect(result["id"], 550);
        },
      );
    });
  });
}
