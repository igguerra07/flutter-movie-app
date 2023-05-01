import 'package:movie_app/src/infra/api/api.dart';

import '../../models/movies_resource_model.dart';
import 'movies_remote_data.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  late final String _resource;
  late final ApiClient _apiClient;

  MoviesRemoteDataSourceImpl({
    required String resource,
    required ApiClient apiClient,
  }) {
    _resource = resource;
    _apiClient = apiClient;
  }

  @override
  Future<MoviesResourceModel> getTrending({
    String mediaType = "tv",
    String timeWindow = "week",
  }) async {
    final trendingPath = "trending/:media_type:/:time_window:"
        .replaceAll(":media_type:", _resource)
        .replaceAll(":time_window:", timeWindow);

    final response = await _apiClient.get(path: trendingPath);

    final data = MoviesResourceModel.fromMap(response.data);

    return data;
  }

  @override
  Future<MoviesResourceModel> search({
    required String query,
  }) async {
    final searchMovieResource = "/search/$_resource";
    final queryParams = {"query": query};

    final response = await _apiClient.get(
      path: searchMovieResource,
      queryParams: queryParams,
    );

    final data = MoviesResourceModel.fromMap(response.data);

    return data;
  }
}
