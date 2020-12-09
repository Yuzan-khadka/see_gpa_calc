import 'package:see_gpa_generator/database/app_database.dart';
import 'package:see_gpa_generator/models/history_model.dart';
import 'package:sembast/sembast.dart';

class HistoryDao {
  static const folderName = 'history';

  final _historyFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertBooks(HistoryModel history) async {
    await _historyFolder.add(await _db, history.toMap());
  }

  Future<List<HistoryModel>> getAllBooks() async {
    final recordSnapshot = await _historyFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final books = HistoryModel.fromMap(snapshot.value);
      return books;
    }).toList();
  }
}
