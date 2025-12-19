import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/close/domain/entities/close_job.dart';
import 'package:telecom_support_app/features/close/domain/usecases/close_job_usecase.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/cubit/sync_cubit.dart';

part 'close_state.dart';

class CloseCubit extends Cubit<CloseState> {
  final CloseJobUseCase useCase;
  final SyncCubit syncCubit; // 👈 optional to trigger sync manually

  CloseCubit(this.useCase, this.syncCubit) : super(const CloseFormState());

  final notesController = TextEditingController();

  final actions = [
    AppStrings.installCompletedKey,
    AppStrings.issueFixedKey,
    AppStrings.noFoundKey,
    AppStrings.customerAvaKey,
  ];

  void selectAction(String value) {
    final current = state as CloseFormState;
    emit(
      CloseFormState(selectedAction: value, pickedImage: current.pickedImage),
    );
  }

  void selectImage(XFile image) {
    final current = state as CloseFormState;
    emit(
      CloseFormState(
        selectedAction: current.selectedAction,
        pickedImage: image,
      ),
    );
  }

  Future<void> submit(int ticketId) async {
    final current = state as CloseFormState;

    if (current.selectedAction == null || current.pickedImage == null) {
      emit(const CloseJobError(error: AppStrings.completedFiledKey));
      emit(current);
      return;
    }

    emit(CloseJobLoading());

    await useCase(
      CloseJob(
        ticketId: ticketId,
        action: current.selectedAction!,
        notes: notesController.text,
        imagePath: current.pickedImage!.path,
      ),
    );

    // ✅ always success (online sent OR offline saved)
    emit(CloseJobSuccess());
  }

  @override
  Future<void> close() {
    notesController.dispose();
    return super.close();
  }
}
