import 'package:sqflite/sqflite.dart';
import '../models/close_job_model.dart';

abstract class CloseJobLocalDS {
  Future<void> save(CloseJobModel model);
  Future<List<CloseJobModel>> getUnsynced();
  Future<void> markSynced(int ticketId);
}

class CloseJobLocalDSImpl implements CloseJobLocalDS {
  final Database db;

  CloseJobLocalDSImpl(this.db);

  @override
  Future<void> save(CloseJobModel model) async {
    await db.insert('close_jobs', model.toDb());
  }

  @override
  Future<List<CloseJobModel>> getUnsynced() async {
    final res = await db.query('close_jobs', where: 'synced = 0');
    return res.map((e) => CloseJobModel.fromDb(e)).toList();
  }

  @override
  Future<void> markSynced(int ticketId) async {
    await db.update(
      'close_jobs',
      {'synced': 1},
      where: 'ticket_id = ?',
      whereArgs: [ticketId],
    );
  }
}
