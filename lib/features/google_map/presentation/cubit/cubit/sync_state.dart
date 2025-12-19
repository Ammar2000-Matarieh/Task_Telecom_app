part of 'sync_cubit.dart';

sealed class SyncState extends Equatable {
  const SyncState();

  @override
  List<Object> get props => [];
}

final class SyncInitial extends SyncState {}

final class SyncOnline extends SyncState {}

final class SyncOffline extends SyncState {}
