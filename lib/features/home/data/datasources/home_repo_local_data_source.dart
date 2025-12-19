import 'package:sqflite/sqlite_api.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

abstract class HomeRepoLocalDataSource {
  Future<void> cacheTickets(List<TicketModel> tickets);
  Future<List<TicketModel>> getCachedTickets();
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
