import 'package:telecom_support_app/core/widgets/responsive_widget.dart';

extension SizeExtension on num {
  double get h => this * ResponsiveSizes.screenHeight! / 100;

  double get w => this * ResponsiveSizes.screenWidth! / 100;

  double get r => this * ResponsiveSizes.screenWidth! / 100;

  double get sp => this * (ResponsiveSizes.screenWidth! / 3) / 100;
}
