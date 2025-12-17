import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/features/google_map/domain/entities/close_job.dart';
import 'package:telecom_support_app/features/google_map/domain/usecases/close_job_usecase.dart';

part 'close_state.dart';

class CloseJobCubit extends Cubit<CloseState> {
  final CloseJobUseCase useCase;

  CloseJobCubit(this.useCase) : super(CloseInitial());

  Future<void> submit(CloseJob job) async {
    emit(CloseJobLoading());
    await useCase(job);
    emit(CloseJobSuccess());
  }
}
