import '../../models/movies_resource_model.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesResourceModel> getTrending({
    String mediaType,
    String timeWindow,
  });

  Future<MoviesResourceModel> search({
    required String query,
  });
}
