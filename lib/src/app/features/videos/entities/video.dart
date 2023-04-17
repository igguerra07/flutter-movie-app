import 'package:equatable/equatable.dart';
import 'package:movie_app/src/app/extensions/extensions.dart';

class Video extends Equatable {
  final String id;
  final String key;
  final String name;
  final String publishedAt;

  String get url => "https://www.youtube.com/watch?v=$key";
  String get publishedAtFormatted => publishedAt.toDateFormat();

  const Video({
    required this.id,
    required this.key,
    required this.name,
    required this.publishedAt,
  });

  @override
  List<Object?> get props => [id, key];
}
