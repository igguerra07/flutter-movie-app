// coverage:ignore-file
import 'package:injectable/injectable.dart';

import 'package:movie_app/src/app/di/injector.dart';

import 'datasources/datasources.dart';
import 'repositories/repositories.dart';

@module
abstract class VideosModule {
  @lazySingleton
  VideosRemoteDataSource get videosRemoteDataSource =>
      VideosRemoteDataSourceImpl(
        resource: getIt(instanceName: "resource"),
        apiClient: getIt(),
      );

  @lazySingleton
  VideosRepository get videosRepository => VideosRepositoryImpl(
        videosRemoteDataSource: getIt(),
      );
}
