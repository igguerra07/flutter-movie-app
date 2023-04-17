import 'package:equatable/equatable.dart';

import '../entities/video.dart';

class VideoPageParams extends Equatable{
  final Video trailer;
  final List<Video> trailers;
  
  const VideoPageParams({
    required this.trailer,
    required this.trailers,
  });
  
  @override
  List<Object?> get props => [trailer, trailers];
}
