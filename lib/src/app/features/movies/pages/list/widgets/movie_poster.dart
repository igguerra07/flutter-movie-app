import 'package:flutter/material.dart';

import 'package:movie_app/src/app/widgets/widgets.dart';

class MoviePoster extends StatelessWidget {
  final double width;
  final double height;
  final String posterUrl;

  const MoviePoster({
    Key? key,
    required this.posterUrl,
    this.width = 80,
    this.height = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ImageFromNetwork(imageUrl: posterUrl),
    );
  }
}
