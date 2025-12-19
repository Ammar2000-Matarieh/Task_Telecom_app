import 'dart:developer';

import 'package:telecom_support_app/core/error/exceptions.dart';
import 'package:telecom_support_app/core/helper/api/api_consumer.dart';
import 'package:telecom_support_app/features/close/data/models/close_job_model.dart';

abstract class CloseJobRemoteDS {
  // Future<void> send(CloseJobModel model);
  Future<void> submit(CloseJobModel model);
}

class CloseJobRemoteDSImpl implements CloseJobRemoteDS {
  final ApiConsumer apiConsumer;

  CloseJobRemoteDSImpl({required this.apiConsumer});

  @override
  Future<void> submit(CloseJobModel model) async {
    try {
      var res = await apiConsumer.post(
        '/close-job',
        body: {
          'ticketId': model.ticketId,
          'action': model.action,
          'notes': model.notes,
          'imagePath': model.imagePath,
        },
      );

      log(res.toString());
    } catch (e) {
      log("Error during Login : $e");
      throw ServerException();
    }
  }

  // @override
  // Future<void> send(CloseJobModel model) async {
  //   await Future.delayed(const Duration(seconds: 1)); // mock API
  // }
}
