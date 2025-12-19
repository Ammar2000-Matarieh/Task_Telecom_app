import 'dart:developer';
import 'package:telecom_support_app/core/error/exceptions.dart';
import 'package:telecom_support_app/core/helper/api/api_consumer.dart';
import 'package:telecom_support_app/core/helper/api/end_points.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

abstract class HomeRepoRemoteDataSource {
  Future<List<TicketModel>> getUsersTickets();
}

class HomeRepoRemoteDataSourceImpl implements HomeRepoRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRepoRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<TicketModel>> getUsersTickets() async {
    try {
      final res = await apiConsumer.get(APIEndPoints.getUsersEndPoint);

      log(res.toString());

      return (res as List).map((e) => TicketModel.fromApi(e)).toList();
    } catch (e) {
      log("Error getting users tickets: $e");
      throw ServerException();
    }
  }
}
