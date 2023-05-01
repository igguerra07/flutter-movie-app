import 'package:movie_app/src/infra/api/api.dart';

import '../models/videos_resource_model.dart';
import 'videos_remote_data.dart';

class VideosRemoteDataSourceImpl implements VideosRemoteDataSource {
  late final String _resource;
  late final ApiClient _apiClient;

  VideosRemoteDataSourceImpl({
    required String resource,
    required ApiClient apiClient,
  }) {
    _resource = resource;
    _apiClient = apiClient;
  }

  @override
  Future<VideosResourceModel> getTrailesByMovieId(int id) async {
    final moviesPath = '/$_resource/:movie_id:/videos'.replaceAll(
      ":movie_id:",
      "$id",
    );

    final response = await _apiClient.get(
      path: moviesPath,
    );

    final data = VideosResourceModel.fromJson(response.data);

    return data;
  }
}
