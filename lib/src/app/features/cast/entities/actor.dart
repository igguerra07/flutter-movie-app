import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  String get profileUrl => 'https://image.tmdb.org/t/p/w500/$profilePath';
  
  const Actor({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [id, profilePath];
}
