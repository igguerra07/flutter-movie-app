import 'package:movie_app/src/shared/errors/failures/app_failure.dart';
import 'package:movie_app/src/shared/errors/failures/failure.dart';

class FailureHandler {
  const FailureHandler();

  static Failure mapToFailure(dynamic error) {
    return const AppFailure();
  }
}
