import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;
  const CustomError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        errorMessage,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
