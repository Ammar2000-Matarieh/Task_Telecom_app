part of 'close_cubit.dart';

sealed class CloseState extends Equatable {
  const CloseState();

  @override
  List<Object> get props => [];
}

final class CloseInitial extends CloseState {}

final class CloseJobLoading extends CloseState {}

final class CloseJobSuccess extends CloseState {}
