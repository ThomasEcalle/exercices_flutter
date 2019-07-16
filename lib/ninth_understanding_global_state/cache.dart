import 'package:flutter_lessons/ninth_understanding_global_state/post.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Cache {
  static Future<Database> _db;


  static Future<Database> _database() async {
    if (_db != null) {
      return _db;
    }
    return openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'pots_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE posts(id INTEGER PRIMARY KEY, title TEXT, body TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  static Future<void> insertPosts(List<Post> posts) async {
    final Database db = await _database();

    final List<Future<int>> insertions = [];
    posts.forEach((post) {
      insertions.add(db.insert(
        'posts',
        post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      ));
    });

    return await Future.wait(insertions);
  }

  static Future<List<Post>> getPosts() async {
    final Database db = await _database();

    final List<Map<String, dynamic>> maps = await db.query('posts');

    return List.generate(maps.length, (i) {
      return Post(
        id: maps[i]['id'],
        title: maps[i]['title'],
        body: maps[i]['body'],
      );
    });
  }
}
