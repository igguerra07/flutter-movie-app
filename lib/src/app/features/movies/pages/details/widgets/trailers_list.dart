import 'package:flutter/material.dart';

import '../../../../videos/entities/video.dart';
import 'trailer_item.dart';

class TrailersList extends StatelessWidget {
  final List<Video> trailers;
  final Function(Video) onTap;

  const TrailersList({
    Key? key,
    required this.onTap,
    required this.trailers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    if (trailers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Trailers',
            style: textTheme.bodyLarge,
          ),
        ),
        SizedBox(
          height: 80 + 16,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => TrailerItem(
              onTap: onTap,
              trailer: trailers[index],
            ),
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemCount: trailers.length,
          ),
        ),
      ],
    );
  }
}
