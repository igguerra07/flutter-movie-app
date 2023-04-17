import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'image_placeholder.dart';

class ImageFromNetwork extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;

  const ImageFromNetwork({
    Key? key,
    required this.imageUrl,
    this.borderRadius = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (_, __) => ImagePlaceholder(
          borderRadius: borderRadius,
        ),
        errorWidget: (_, __, ___) => ImagePlaceholder(
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
