import 'package:movie_app/src/infra/api/api.dart';

import '../../models/movies_resource_model.dart';
import 'movies_remote_data.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  late final ApiClient _apiClient;

  MoviesRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) {
    _apiClient = apiClient;
  }

  @override
  Future<MoviesResourceModel> getTrending({
    String mediaType = "movie",
    String timeWindow = "week",
  }) async {
    final trendingPath = "trending/:media_type:/:time_window:"
        .replaceAll(":media_type:", mediaType)
        .replaceAll(":time_window:", timeWindow);

    final response = await _apiClient.get(path: trendingPath);

    final data = MoviesResourceModel.fromMap(response.data);

    return data;
  }

  @override
  Future<MoviesResourceModel> search({
    required String query,
  }) async {
    const searchMovieResource = "/search/movie";
    final queryParams = {"query": query};

    final response = await _apiClient.get(
      path: searchMovieResource,
      queryParams: queryParams,
    );

    final data = MoviesResourceModel.fromMap(response.data);

    return data;
  }
}
