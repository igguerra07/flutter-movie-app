import 'package:movie_app/src/shared/errors/failures/failure.dart';

class AppFailure extends Failure {
  const AppFailure();
  
  @override
  String? get message => "Something went wrong...";
}
