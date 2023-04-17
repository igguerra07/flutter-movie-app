import 'actor_model.dart';

class CastResourceModel {
  final int id;
  final List<ActorModel> cast;
  CastResourceModel({
    required this.id,
    required this.cast,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cast': cast.map((x) => x.toJson()).toList(),
    };
  }

  factory CastResourceModel.fromJson(Map<String, dynamic> json) {
    return CastResourceModel(
      id: json['id']?.toInt() ?? 0,
      cast: List<ActorModel>.from(
        json['cast']?.map((x) => ActorModel.fromJson(x)),
      ),
    );
  }
}
