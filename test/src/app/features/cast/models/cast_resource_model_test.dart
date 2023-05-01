import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/app/features/cast/models/cast_resource_model.dart';

import '../../../../../fixtures/cast/cast_fixtures.dart';
import '../../../../../fixtures/fixtures_reader.dart';

void main() {
  group("CastResourceModel |", () {
    group("FromJson", () {
      test(
        "Should return [CastResourceModel] when to able get model from JSON",
        () {
          final raw = fixture(CastFixtures.castResourceResponse);
          final json = jsonDecode(raw);

          final result = CastResourceModel.fromJson(json);

          expect(result, isA<CastResourceModel>());
        },
      );
    });

    group("toJson", () {
      test(
        "Should return [Map<String, dynamic] when to able parse to JSON",
        () {
          final raw = fixture(CastFixtures.castResourceResponse);
          final json = jsonDecode(raw);
          final resource = CastResourceModel.fromJson(json);

          final result = resource.toJson();

          expect(result, isA<Map<String, dynamic>>());
          expect(result["id"], 550);
        },
      );
    });
  });
}
