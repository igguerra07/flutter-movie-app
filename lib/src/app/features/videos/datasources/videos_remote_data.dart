import 'package:movie_app/src/app/features/videos/models/videos_resource_model.dart';

abstract class VideosRemoteDataSource {
  Future<VideosResourceModel> getTrailesByMovieId(int id);
}
