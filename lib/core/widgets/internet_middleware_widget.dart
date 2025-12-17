import 'package:flutter/material.dart';
import 'package:telecom_support_app/config/injection_container.dart';
import 'package:telecom_support_app/core/network/network_info.dart';

class InternetMiddlewareWidget extends StatelessWidget {
  const InternetMiddlewareWidget({
    super.key,
    required this.child,
    this.isProductDetails = false,
  });
  final Widget child;
  final bool isProductDetails;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl<NetworkInfo>().isConnected,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.data!) {
          return child;
        } else {
          return !isProductDetails
              ? const Text("No Internet ")
              : const Scaffold(body: Text("No Internet Found"));
        }
      },
    );
  }
}
