import 'package:flutter/material.dart';
import 'package:movie_app/src/app/widgets/widgets.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movie_app/src/app/features/movies/pages/details/widgets/widgets.dart';

import '../entities/video.dart';
import 'video_page_params.dart';

class VideoPage extends StatefulWidget {
  final VideoPageParams params;

  const VideoPage({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final YoutubePlayerController _controller;

  Video get _trailer => widget.params.trailer;
  List<Video> get _trailers => widget.params.trailers;

  late String title;
  late String date;
  late List<Video> videos;

  @override
  void initState() {
    title = _trailer.name;
    date = _trailer.publishedAtFormatted;
    videos = _trailers.where((element) => element.id != _trailer.id).toList();
    _controller = YoutubePlayerController(
      initialVideoId: _trailer.key,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                YoutubePlayer(controller: _controller),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconCircleButton(
                    splashColor: Colors.white,
                    icon: Icons.arrow_back,
                    onPressed: _onBackPressed,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      date,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: videos.length,
                itemBuilder: (_, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TrailerItem(
                      onTap: _onTapTrailer,
                      trailer: videos[index],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      videos[index].publishedAtFormatted,
                      style: textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      videos[index].name,
                      style: textTheme.headlineSmall,
                    ),
                  ],
                ),
                separatorBuilder: (_, __) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
  }

  void _onTapTrailer(Video currentTrailer) {
    _controller.load(currentTrailer.key);
    final updatedTrailers = _trailers.where(
      (element) => element.id != currentTrailer.id,
    );
    setState(() {
      title = currentTrailer.name;
      date = currentTrailer.publishedAtFormatted;
      videos = updatedTrailers.toList();
    });
  }
}
