import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/sync/sync_cubit.dart';
import 'package:telecom_support_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:telecom_support_app/features/home/presentation/widgets/custom_active_tickets.dart';

class ActiveTickets extends StatelessWidget {
  const ActiveTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SyncCubit, SyncState>(
      listenWhen: (previous, current) =>
          previous is SyncInitial && current is! SyncInitial,
      listener: (context, state) {
        context.read<SyncCubit>().start();
        context.read<HomeCubit>().activeTicketsRequest();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.activeTicketsKey),
          centerTitle: true,
        ),
        body: const CustomActiveTicketsWidget(),
      ),
    );
  }
}
