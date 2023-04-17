import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:movie_app/src/app/features/videos/videos.dart';
import 'package:movie_app/src/app/widgets/widgets.dart';

class TrailerItem extends StatelessWidget {
  final Video trailer;
  final Function(Video) onTap;

  const TrailerItem({
    Key? key,
    required this.onTap,
    required this.trailer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ImageFromNetwork(
              imageUrl: YoutubePlayer.getThumbnail(
                videoId: trailer.key,
              ),
            ),
            Center(
              child: IconCircleButton(
                width: 36,
                height: 36,
                icon: Icons.play_arrow,
                splashColorOpacity: .8,
                onPressed: () => onTap(trailer),
              ),
            )
          ],
        ),
      ),
    );
  }
}
