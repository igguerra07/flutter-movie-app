class ActorModel {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  ActorModel({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'character': character,
      'profile_path': profilePath,
    };
  }

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      profilePath: json['profile_path'] ?? '',
    );
  }
}
