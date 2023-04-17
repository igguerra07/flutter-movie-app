class VideoModel {
  final String id;
  final String key;
  final String name;
  final String publishedAt;

  VideoModel({
    required this.id,
    required this.key,
    required this.name,
    required this.publishedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'name': name,
      'published_at': publishedAt,
    };
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? '',
      key: json['key'] ?? '',
      name: json['name'] ?? '',
      publishedAt: json['published_at'] ?? '',
    );
  }
}
