import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/config/injection_container.dart';
import 'package:telecom_support_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telecom_support_app/features/home/presentation/cubit/home_cubit.dart';

class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // App Feature Cubits
        BlocProvider(create: (context) => sl<AuthCubit>()),
        BlocProvider(create: (context) => sl<HomeCubit>()),
      ],
      child: child,
    );
  }
}
