import 'package:telecom_support_app/core/network/network_info.dart';

import '../../domain/entities/close_job.dart';
import '../../domain/repositories/close_job_repo.dart';
import '../datasources/close_job_local_ds.dart';
import '../datasources/close_job_remote_ds.dart';
import '../models/close_job_model.dart';

class CloseJobRepoImpl implements CloseJobRepo {
  final CloseJobLocalDS local;
  final CloseJobRemoteDS remote;
  final NetworkInfo networkInfo;

  CloseJobRepoImpl(this.local, this.remote, this.networkInfo);

  @override
  Future<void> closeJob(CloseJob job) async {
    final model = CloseJobModel(
      ticketId: job.ticketId,
      action: job.action,
      notes: job.notes,
      imagePath: job.imagePath,
      synced: false,
    );

    if (await networkInfo.isConnected) {
      await remote.send(model);
    } else {
      await local.save(model);
    }
  }

  @override
  Future<void> syncPendingJobs() async {
    if (!await networkInfo.isConnected) return;

    final jobs = await local.getUnsynced();
    for (final job in jobs) {
      await remote.send(job);
      await local.markSynced(job.ticketId);
    }
  }
}
