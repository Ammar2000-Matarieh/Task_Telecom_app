import 'dart:developer';

import 'package:sqflite/sqlite_api.dart';
import 'package:telecom_support_app/core/error/exceptions.dart';
import 'package:telecom_support_app/core/helper/api/api_consumer.dart';
import 'package:telecom_support_app/core/helper/api/end_points.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

abstract class HomeRepoLocalDataSource {
  Future<void> cacheTickets(List<TicketModel> tickets);
  Future<List<TicketModel>> getCachedTickets();
}

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

class HomeRepoLocalDataSourceImpl implements HomeRepoLocalDataSource {
  final Database database;

  HomeRepoLocalDataSourceImpl(this.database);

  @override
  Future<void> cacheTickets(List<TicketModel> tickets) async {
    final batch = database.batch();

    for (final ticket in tickets) {
      batch.insert(
        'tickets',
        ticket.toDb(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<List<TicketModel>> getCachedTickets() async {
    final res = await database.query('tickets');
    return res.map((e) => TicketModel.fromDb(e)).toList();
  }
}
