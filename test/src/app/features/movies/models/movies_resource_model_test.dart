import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/app/features/movies/movies.dart';

import '../../../../../fixtures/fixtures_reader.dart';
import '../../../../../fixtures/movies/movies_fixtures.dart';

void main() {
  group("MoviesResourceModel |", () {
    group("FromJson", () {
      test(
        "Should return [MoviesResourceModel] when to able get model from JSON",
        () {
          final raw = fixture(MoviesFixtures.getTreandingResponse);
          final json = jsonDecode(raw);

          final result = MoviesResourceModel.fromMap(json);

          expect(result, isA<MoviesResourceModel>());
        },
      );

      test(
        "Should return [MoviesResourceModel] when no receive results",
        () {
          final raw = fixture(MoviesFixtures.getTreandingResponse);
          final json = jsonDecode(raw);
          json["results"] = null;
          final result = MoviesResourceModel.fromMap(json);

          expect(result, isA<MoviesResourceModel>());
          expect(result, isA<MoviesResourceModel>());
        },
      );
    });

    group("toJson", () {
      test(
        "Should return [Map<String, dynamic] when to able parse to JSON",
        () {
          final raw = fixture(MoviesFixtures.getTreandingResponse);
          final json = jsonDecode(raw);
          final resource = MoviesResourceModel.fromMap(json);

          final result = resource.toJson();

          expect(result, isA<Map<String, dynamic>>());
          expect(result["page"], 1);
        },
      );
    });
  });
}
