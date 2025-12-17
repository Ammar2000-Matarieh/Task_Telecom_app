import '../models/close_job_model.dart';

abstract class CloseJobRemoteDS {
  Future<void> send(CloseJobModel model);
}

class CloseJobRemoteDSImpl implements CloseJobRemoteDS {
  @override
  Future<void> send(CloseJobModel model) async {
    await Future.delayed(const Duration(seconds: 1)); // mock API
  }
}
