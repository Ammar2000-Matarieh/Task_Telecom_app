part of 'close_cubit.dart';

sealed class CloseState extends Equatable {
  const CloseState();

  @override
  List<Object?> get props => [];
}

/// 🟢 Form State (المصدر الوحيد للحقيقة)
final class CloseFormState extends CloseState {
  final String? selectedAction;
  final XFile? pickedImage;

  const CloseFormState({this.selectedAction, this.pickedImage});

  @override
  List<Object?> get props => [selectedAction, pickedImage];
}

/// ⏳ Loading
final class CloseJobLoading extends CloseState {}

/// ✅ Success
final class CloseJobSuccess extends CloseState {}

/// ❌ Error
final class CloseJobError extends CloseState {
  final String error;

  const CloseJobError({required this.error});

  @override
  List<Object?> get props => [error];
}
