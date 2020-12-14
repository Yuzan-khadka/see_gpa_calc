import 'package:see_gpa_generator/database/app_database.dart';
import 'package:see_gpa_generator/models/history_model.dart';
import 'package:sembast/sembast.dart';

class HistoryDao {
  static const String folderName = 'history';

  static const int recordNumber = 10;

  final _historyFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertData(HistoryModel history) async {
    final result = await getAllData();

    final keys = result.map((e) => e.id).toList();
    keys.sort();
    for (int i = keys.length; i > 0; i--) {
      if (i > recordNumber) {
        final deleteID = keys.first;
        await deleteHistory(deleteID);
        keys.removeAt(0);
      } else {
        break;
      }
    }
    await _historyFolder.add(await _db, history.toMap());
    
  }


  Future deleteHistory(int historyID) async {
    final finder = Finder(
      filter: Filter.byKey(historyID),
    );
    await _historyFolder.delete(await _db, finder: finder);
  }

  Future<List<HistoryModel>> getAllData() async {
    final finder = Finder(sortOrders: [
      SortOrder('dateTime', false, true),
    ]);
    final recordSnapshot = await _historyFolder.find(await _db, finder: finder);

    return recordSnapshot.map((snapshot) {
      final history = HistoryModel.fromMap(snapshot.value);
      history.id = snapshot.key;
      return history;
    }).toList();
  }
}
