import 'package:flutter/material.dart';

import 'package:movie_app/src/app/widgets/widgets.dart';

class MovieBackdrop extends StatelessWidget {
  final String backdropUrl;
  final VoidCallback onPressed;

  const MovieBackdrop({
    Key? key,
    required this.backdropUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ImageFromNetwork(
          borderRadius: 0,
          imageUrl: backdropUrl,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: IconCircleButton(
            icon: Icons.arrow_back,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
