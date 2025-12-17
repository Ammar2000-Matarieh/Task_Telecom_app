import 'package:telecom_support_app/features/google_map/domain/entities/close_job.dart';

abstract class CloseJobRepo {
  Future<void> closeJob(CloseJob job);
  Future<void> syncPendingJobs();
}
