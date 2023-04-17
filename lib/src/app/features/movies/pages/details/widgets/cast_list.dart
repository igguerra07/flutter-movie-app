import 'package:flutter/material.dart';

import '../../../../cast/entities/actor.dart';
import 'actor_item.dart';

class CastList extends StatelessWidget {
  final List<Actor> cast;

  const CastList({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    if (cast.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Cast',
            style: textTheme.bodyLarge,
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shrinkWrap: false,
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => ActorItem(actor: cast[index]),
            separatorBuilder: (_, __) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }
}
