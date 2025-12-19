import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/close/presentation/cubit/close_cubit.dart';
import 'package:telecom_support_app/features/close/presentation/widgets/custom_close_job_widget.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/sync/sync_cubit.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class CloseJobScreen extends StatelessWidget {
  final TicketModel ticket;

  const CloseJobScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.closeJobKey)),
      body: BlocListener<CloseCubit, CloseState>(
        listener: (context, state) {
          final syncState = context.read<SyncCubit>().state;
          final isOnline = syncState is SyncOnline;

          if (state is CloseJobSuccess) {
            final msg = isOnline
                ? AppStrings.closeJobSuccess
                : AppStrings.savedOfflineWillSyncKey;

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(msg)));
            Navigator.pop(context);
          }

          if (state is CloseJobError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: CustomCloseJobWidget(ticket: ticket),
      ),
    );
  }
}
