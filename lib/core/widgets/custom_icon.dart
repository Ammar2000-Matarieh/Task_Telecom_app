import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
    required this.iconData,
  });
  final Color? iconColor;
  final IconData iconData;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      IconButton.filled(
        onPressed: onPressed,
        icon: Icon(iconData),
        color: iconColor ?? Colors.black,
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
        ),
      ),
    ],
  );
}
