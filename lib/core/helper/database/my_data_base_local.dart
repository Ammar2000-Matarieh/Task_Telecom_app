import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:telecom_support_app/features/home/data/models/tickets_model.dart';

class TicketsDb {
  static final TicketsDb instance = TicketsDb._();
  TicketsDb._();

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'tickets.db');
    return openDatabase(
      path,
      version: 2,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE tickets(
            id INTEGER PRIMARY KEY,
            customer_name TEXT,
            email TEXT,
            phone TEXT,
            lat REAL,
            lng REAL
            priority TEXT
          )
        ''');
      },
    );
  }

  Future<void> cacheTickets(List<TicketModel> tickets) async {
    final db = await database;
    final batch = db.batch();

    for (final ticket in tickets) {
      batch.insert(
        'tickets',
        ticket.toDb(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<TicketModel>> getCachedTickets() async {
    final db = await database;
    final res = await db.query('tickets');
    return res.map(TicketModel.fromDb).toList();
  }
}
