import 'video_model.dart';

class VideosResourceModel {
  final int id;
  final List<VideoModel> results;

  VideosResourceModel({
    required this.id,
    required this.results,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': results.map((x) => x.toJson()).toList(),
    };
  }

  factory VideosResourceModel.fromJson(Map<String, dynamic> json) {
    return VideosResourceModel(
      id: json['id']?.toInt() ?? 0,
      results: List<VideoModel>.from(
        json['results']?.map((x) => VideoModel.fromJson(x)),
      ),
    );
  }
}
