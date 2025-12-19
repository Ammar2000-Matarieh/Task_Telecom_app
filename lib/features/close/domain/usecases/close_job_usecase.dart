import 'package:telecom_support_app/features/close/domain/entities/close_job.dart';
import 'package:telecom_support_app/features/close/domain/repositories/close_job_repo.dart';

class CloseJobUseCase {
  final CloseJobRepo repo;

  CloseJobUseCase(this.repo);

  Future<void> call(CloseJob job) {
    return repo.closeJob(job);
  }
}
