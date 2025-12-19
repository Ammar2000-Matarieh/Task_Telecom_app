import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telecom_support_app/core/extensions/size.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';

void showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      title: Row(
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle_fill,
            color: Colors.red,
          ),
          SizedBox(width: 4.w),
          Text(AppStrings.errorLoginKey),
        ],
      ),
      content: Text(AppStrings.errorDescLoginKey),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppStrings.okPopUp),
        ),
      ],
    ),
  );
}
