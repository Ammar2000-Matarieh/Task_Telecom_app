import 'package:telecom_support_app/features/close/domain/entities/close_job.dart';

abstract class CloseJobRepo {
  Future<void> closeJob(CloseJob job);
  Future<void> syncPendingJobs();
}
