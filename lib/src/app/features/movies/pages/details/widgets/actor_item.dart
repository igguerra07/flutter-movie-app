import 'package:flutter/material.dart';

import 'package:movie_app/src/app/widgets/widgets.dart';
import 'package:movie_app/src/app/features/cast/cast.dart';

class ActorItem extends StatelessWidget {
  final Actor actor;
  final double width;
  final double height;

  const ActorItem({
    Key? key,
    required this.actor,
    this.width = 80,
    this.height = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ImageFromNetwork(
              imageUrl: actor.profileUrl,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            flex: 1,
            child: Text(
              actor.name,
              style: textTheme.bodySmall,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
