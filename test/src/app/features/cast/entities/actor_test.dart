import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/app/features/cast/cast.dart';

void main() {
  group('Actor |', () {
    test("Equality", () {
      const actor1 = Actor(
        id: 1,
        name: "name",
        character: "character",
        profilePath: "profilePath",
      );
      const actor2 = Actor(
        id: 1,
        name: "name",
        character: "character",
        profilePath: "profilePath",
      );

      final check = actor1 == actor2;

      expect(check, true);
    });
    // test("profileUrl", () {
    //   const profilePath = "profilePath";
    //   const profileUrl = 'https://image.tmdb.org/t/p/w500/$profilePath';
    //   const actor = Actor(
    //     id: 1,
    //     name: "name",
    //     character: "character",
    //     profilePath: profilePath,
    //   );

    //   expect(actor.profileUrl, profileUrl);
    // });

    // test("toString", () {
    //   const actor = Actor(
    //     id: 1,
    //     name: "name",
    //     character: "character",
    //     profilePath: "profilePath",
    //   );

    //   expect(actor.toString(), isA<String>());
    // });
  });
}
