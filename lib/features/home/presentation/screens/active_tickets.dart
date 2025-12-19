import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/sync/sync_cubit.dart';
import 'package:telecom_support_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:telecom_support_app/features/home/presentation/widgets/custom_active_tickets.dart';

class ActiveTickets extends StatefulWidget {
  const ActiveTickets({super.key});

  @override
  State<ActiveTickets> createState() => _ActiveTicketsState();
}

class _ActiveTicketsState extends State<ActiveTickets> {
  @override
  void initState() {
    super.initState();

    // 1️⃣ Start connectivity + sync listener
    context.read<SyncCubit>().start();

    // 2️⃣ Load tickets
    context.read<HomeCubit>().activeTicketsRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.activeTicketsKey),
        centerTitle: true,
      ),
      body: CustomActiveTicketsWidget(),
    );
  }
}
