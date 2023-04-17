// coverage:ignore-file
import 'package:injectable/injectable.dart';

import 'package:movie_app/src/app/di/injector.dart';

import 'datasources/datasources.dart';
import 'repositories/repositories.dart';

@module
abstract class CastModule {
  @lazySingleton
  CastRemoteDataSource get castRemoteData => CastRemoteDataSourceImpl(
        apiClient: getIt(),
      );

  @lazySingleton
  CastRepository get castRepository => CastRepositoryImpl(
        castRemoteDataSource: getIt(),
      );
}
