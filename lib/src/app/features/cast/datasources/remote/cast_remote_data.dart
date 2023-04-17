

import '../../models/cast_resource_model.dart';

abstract class CastRemoteDataSource {
  Future<CastResourceModel> getCreditsByMovieId(int id);
}
