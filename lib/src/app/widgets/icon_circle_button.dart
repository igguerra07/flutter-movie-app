import 'package:flutter/material.dart';

class IconCircleButton extends StatelessWidget {
  final double width;
  final IconData icon;
  final double height;
  final Color iconColor;
  final Color splashColor;
  final double splashColorOpacity;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const IconCircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.width = 48,
    this.height = 48,
    this.iconColor = Colors.white,
    this.splashColor = Colors.black,
    this.padding = const EdgeInsets.all(4),
    this.splashColorOpacity = .25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipOval(
        child: Material(
          color: splashColor.withOpacity(splashColorOpacity),
          child: InkWell(
            onTap: onPressed,
            child: SizedBox(
              width: width,
              height: height,
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
