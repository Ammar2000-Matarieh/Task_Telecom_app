import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBaseLocal {
  static final MyDataBaseLocal instance = MyDataBaseLocal._();
  MyDataBaseLocal._();

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'telecom_support.db');

    return openDatabase(
      path,
      version: 2,
      onCreate: (db, _) async {
        // tickets
        await db.execute('''
          CREATE TABLE tickets(
            id INTEGER PRIMARY KEY,
            customer_name TEXT,
            email TEXT,
            phone TEXT,
            priority TEXT,
            lat REAL,
            lng REAL
          )
        ''');

        // close_jobs queue
        await db.execute('''
          CREATE TABLE close_jobs(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ticket_id INTEGER NOT NULL,
            action TEXT NOT NULL,
            notes TEXT,
            image_path TEXT NOT NULL,
            synced INTEGER NOT NULL DEFAULT 0,
            created_at INTEGER NOT NULL
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS close_jobs(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              ticket_id INTEGER NOT NULL,
              action TEXT NOT NULL,
              notes TEXT,
              image_path TEXT NOT NULL,
              synced INTEGER NOT NULL DEFAULT 0,
              created_at INTEGER NOT NULL
            )
          ''');
        }
      },
    );
  }

  Future<int> insertCloseJob(Map<String, dynamic> row) async {
    final db = await database;
    return db.insert('close_jobs', row);
  }

  Future<List<Map<String, dynamic>>> getPendingCloseJobs() async {
    final db = await database;
    return db.query(
      'close_jobs',
      where: 'synced = ?',
      whereArgs: [0],
      orderBy: 'created_at ASC',
    );
  }

  Future<void> markSynced(int id) async {
    final db = await database;
    await db.update(
      'close_jobs',
      {'synced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
