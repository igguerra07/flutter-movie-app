import 'package:flutter/material.dart';

class MovieAverage extends StatelessWidget {
  final String average;

  const MovieAverage({
    Key? key,
    required this.average,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
   
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        average,
        style: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
