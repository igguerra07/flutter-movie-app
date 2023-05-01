import 'package:movie_app/src/infra/api/api.dart';

import '../../models/cast_resource_model.dart';
import 'cast_remote_data.dart';

class CastRemoteDataSourceImpl implements CastRemoteDataSource {
  late final ApiClient _apiClient;
  late final String _resource;

  CastRemoteDataSourceImpl({
    required String resource,
    required ApiClient apiClient,
  }) {
    _resource = resource;
    _apiClient = apiClient;
  }

  @override
  Future<CastResourceModel> getCreditsByMovieId(int id) async {
    final castPath = '/$_resource/:movie_id:/credits'.replaceAll(
      ":movie_id:",
      "$id",
    );

    final response = await _apiClient.get(
      path: castPath,
    );

    final data = CastResourceModel.fromJson(response.data);

    return data;
  }
}
