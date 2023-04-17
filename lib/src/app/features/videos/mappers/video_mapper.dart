import '../entities/video.dart';
import '../models/video_model.dart';

extension VideoExtension on Video {
  VideoModel toModel() {
    return VideoModel(
      id: id,
      key: key,
      name: name,
      publishedAt: publishedAt,
    );
  }
}

extension VideosListExtension on List<Video> {
  List<VideoModel> toModels() {
    final models = map((video) => video.toModel());
    return models.toList();
  }
}

extension VideoModelExtension on VideoModel {
  Video toDomainModel() {
    return Video(
      id: id,
      key: key,
      name: name,
      publishedAt: publishedAt,
    );
  }
}

extension VideosListModelExtension on List<VideoModel> {
  List<Video> toDomainModel() {
    final videos = map((model) => model.toDomainModel());
    return videos.toList();
  }
}
