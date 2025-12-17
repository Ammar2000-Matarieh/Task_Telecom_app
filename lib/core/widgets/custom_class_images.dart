import 'package:flutter/material.dart';

class CustomImageWrapPopUp extends StatelessWidget {
  final String? imageBytes;
  final double imageSize;
  final double borderRadius;

  const CustomImageWrapPopUp({
    super.key,
    required this.imageBytes,
    this.imageSize = 90,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    if (imageBytes == null || imageBytes!.isEmpty) {
      return const Text(
        "No image uploaded yet.",
        style: TextStyle(color: Colors.grey),
      );
    }

    String decodedBytes = imageBytes!;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Image.asset(decodedBytes, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
