import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

Map<int, String> scripts = {
  1: '''CREATE TABLE registro_imc (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  peso REAL,
  altura REAL,
  imc REAL,
  faixa TEXT,
  data TEXT
  )
'''
};

class SqliteDatabase {
  static Database? _db;

  Future iniciarBancoDeDados() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate: (Database db, int version) async {
        try {
          for (var i = 1; i <= scripts.length; i++) {
            await db.execute(scripts[i]!);
          }
        } catch (e) {
          
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        try {
          for (var i = oldVersion+1; i <= scripts.length; i++) {
            await db.execute(scripts[i]!);
          }
        } catch (e) {
          
        }
      },
    );

    _db = db;
  }

  Future<Database> getDatabase() async {
    if (_db == null) {
      await iniciarBancoDeDados();
      return _db!;
    }

    return _db!;
  }
}