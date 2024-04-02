import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import './database.dart';

class DatabaseImpl extends Database {
  Isar? _databaseInstance;

  @override
  Future<Isar> openConnection() async {
    if (_databaseInstance == null) {
      final dir = await getApplicationSupportDirectory();
      _databaseInstance = await Isar.open(
        schemas: [],
        directory: dir.path,
        inspector: true,
      );
    }

    return _databaseInstance!;
  }
}