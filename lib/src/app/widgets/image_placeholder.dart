import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final Color color;
  final double borderRadius;

  const ImagePlaceholder({
    Key? key,
    this.color = Colors.grey,
    this.borderRadius = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
