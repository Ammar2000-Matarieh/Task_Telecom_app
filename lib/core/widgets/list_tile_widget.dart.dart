import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:telecom_support_app/core/extensions/size.dart';
import 'package:telecom_support_app/core/utils/app_colors.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.text,
    this.title,
    this.onTap,
    this.trailing,
    this.isLogout = false,
    required this.leading,
  });

  final String? text;
  final Widget? title;
  final bool isLogout;
  final IconData leading;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(2.r),
      ),
      leading: Icon(leading, color: isLogout ? Colors.red : AppColors.primary),
      trailing: isLogout
          ? null
          : trailing ??
                const Icon(CupertinoIcons.forward, color: AppColors.primary),
      title:
          title ?? Text(text!, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
