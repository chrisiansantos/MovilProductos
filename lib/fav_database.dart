import 'package:parcial_christian_santos/producto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavDatabase {
  static final FavDatabase instance = FavDatabase._init();

  static Database? _database;

  FavDatabase._init();

  final String tableFavItems = 'fav_items';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('fav.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE $tableFavItems(
id INTEGER PRIMARY KEY,
nombre TEXT,
vendedor TEXT,
calificacion INTEGER
)
''');
  }

  Future<void> insert(FavItem item) async {
    final db = await instance.database;
    await db.insert(tableFavItems, item.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

 Future<List<FavItem>> getAllItems() async {
  final db = await instance.database;
  final List<Map<String, dynamic>> maps = await db.query(tableFavItems);

  return List.generate(maps.length, (index) {
    return FavItem(
      maps[index]['id'], 
      maps[index]['nombre'], 
      maps[index]['vendedor'], 
      maps[index]['calificacion']
    );
  });
}

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(tableFavItems, where: "id = ?", whereArgs: [id],);
  }
}
