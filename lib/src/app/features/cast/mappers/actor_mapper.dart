// coverage:ignore-file
import '../entities/actor.dart';
import '../models/actor_model.dart';

extension ActorModelExtension on ActorModel {
  Actor toDomainModel() {
    return Actor(
      id: id,
      name: name,
      character: character,
      profilePath: profilePath,
    );
  }
}

extension ActorsListModelExtension on List<ActorModel> {
  List<Actor> toDomainModel() {
    final actors = map((model) => model.toDomainModel());
    return actors.toList();
  }
}

extension ActorExtension on Actor {
  ActorModel toModel() {
    return ActorModel(
      id: id,
      name: name,
      character: character,
      profilePath: profilePath,
    );
  }
}

extension ActorsListExtension on List<Actor> {
  List<ActorModel> toModel() {
    final models = map((actor) => actor.toModel());
    return models.toList();
  }
}
