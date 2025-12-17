import '../entities/close_job.dart';
import '../repositories/close_job_repo.dart';

class CloseJobUseCase {
  final CloseJobRepo repo;

  CloseJobUseCase(this.repo);

  Future<void> call(CloseJob job) {
    return repo.closeJob(job);
  }
}
