import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  //create single instance of AppDatabase via the private constructor
  static final AppDatabase _instance = AppDatabase._();

  //getter for class instance
  static AppDatabase get instance => _instance;

  Completer<Database> _dbOpenCompleter;

  //private constructor
  AppDatabase._();

  Future<Database> get database async {
    
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      await _openDatabase();
    }


    return _dbOpenCompleter.future;
  }

  Future<void> _openDatabase() async {
    //get application directory
    final directory = await getApplicationDocumentsDirectory();

    //construct path
    final dbPath = join(directory.path, "see.db");

    //open database
    final db = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(db);
  }
}
