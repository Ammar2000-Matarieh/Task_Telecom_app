import 'package:telecom_support_app/core/network/network_info.dart';
import 'package:telecom_support_app/features/close/data/datasources/close_job_local_ds.dart';
import 'package:telecom_support_app/features/close/data/datasources/close_job_remote_ds.dart';
import 'package:telecom_support_app/features/close/data/models/close_job_model.dart';
import 'package:telecom_support_app/features/close/domain/entities/close_job.dart';
import 'package:telecom_support_app/features/close/domain/repositories/close_job_repo.dart';

class CloseJobRepoImpl implements CloseJobRepo {
  final CloseJobRemoteDS remote;
  final CloseJobLocalDS local;
  final NetworkInfo networkInfo;

  CloseJobRepoImpl({
    required this.remote,
    required this.local,
    required this.networkInfo,
  });

  @override
  Future<void> closeJob(CloseJob job) async {
    final model = CloseJobModel(
      ticketId: job.ticketId,
      action: job.action,
      notes: job.notes,
      imagePath: job.imagePath,
    );

    final connected = await networkInfo.isConnected;

    if (!connected) {
      await local.save(model); // ✅ save offline
      return;
    }

    try {
      await remote.submit(model); // ✅ try send online
    } catch (_) {
      await local.save(model); // ✅ fallback save
    }
  }

  @override
  Future<void> syncPendingJobs() async {
    final connected = await networkInfo.isConnected;
    if (!connected) return;

    final pending = await local.getUnsynced();

    for (final job in pending) {
      try {
        await remote.submit(job);
        if (job.rowId != null) {
          await local.markSyncedById(job.rowId!);
        }
      } catch (_) {
        // stop or continue? شركات تفضل continue
        continue;
      }
    }
  }
}
