import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/features/close/domain/repositories/close_job_repo.dart';

part 'sync_state.dart';

class SyncCubit extends Cubit<SyncState> {
  final CloseJobRepo repo;
  final Connectivity connectivity;
  StreamSubscription? _sub;

  SyncCubit(this.repo, this.connectivity) : super(SyncInitial());

  Future<void> start() async {
    final result = await connectivity.checkConnectivity();
    final isOnline = result != ConnectivityResult.none;

    if (isOnline) {
      emit(SyncOnline());
      await repo.syncPendingJobs();
    } else {
      emit(SyncOffline());
    }

    _sub ??= connectivity.onConnectivityChanged.listen((result) async {
      final online = result != ConnectivityResult.none;

      if (online) {
        emit(SyncOnline());
        await repo.syncPendingJobs();
      } else {
        emit(SyncOffline());
      }
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
