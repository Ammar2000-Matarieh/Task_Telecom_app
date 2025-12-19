import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/close/presentation/cubit/close_cubit.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/sync/sync_cubit.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class CustomCloseJobWidget extends StatelessWidget {
  final TicketModel ticket;
  const CustomCloseJobWidget({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CloseCubit, CloseState>(
      builder: (context, state) {
        if (state is CloseJobLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is! CloseFormState) return const SizedBox.shrink();

        final cubit = context.read<CloseCubit>();

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                hint: Text(AppStrings.actionTakenKey),
                initialValue: state.selectedAction,
                items: cubit.actions
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) cubit.selectAction(val);
                },
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.camera_alt),
                      label: Text(
                        state.pickedImage == null
                            ? AppStrings.pickImageKey
                            : AppStrings.imageSuccessSelected,
                      ),
                      onPressed: () async {
                        final picker = ImagePicker();
                        final image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (image != null) cubit.selectImage(image);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              TextField(
                controller: cubit.notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: AppStrings.notesKey,
                  border: const OutlineInputBorder(),
                ),
              ),

              const Spacer(),

              BlocBuilder<SyncCubit, SyncState>(
                builder: (context, syncState) {
                  if (syncState is SyncOffline) {
                    return SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.sync),
                        onPressed: () => context.read<SyncCubit>().start(),
                        label: Text(AppStrings.trySyncNowKey),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => cubit.submit(ticket.id),
                  child: Text(AppStrings.submitKey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
