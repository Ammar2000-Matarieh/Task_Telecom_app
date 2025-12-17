import 'package:flutter/material.dart';
import 'package:telecom_support_app/core/extensions/size.dart';
import 'package:telecom_support_app/core/utils/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.width,
    this.height,
    this.fontSize,
    this.textColor,
    this.elevation,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
  });

  final String text;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? elevation;
  final double? fontSize;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide.none,
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: AppColors.grey,
        minimumSize: Size(width ?? 100.w, height ?? 47),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize ?? 12.sp, color: textColor),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.width,
    this.height,
    this.textColor,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final double? width;
  final double? height;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: const BorderSide(color: AppColors.grey),
        minimumSize: Size(width ?? 100.w, height ?? 47),
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.apply(color: textColor ?? AppColors.black),
      ),
    );
  }
}
