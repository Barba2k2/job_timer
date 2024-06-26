import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../entities/project.dart';
import '../../entities/project_task.dart';
import './database.dart';

class DatabaseImpl implements Database {
  Isar? _databaseInstance;

  @override
  Future<Isar> openConnection() async {
    if (_databaseInstance == null) {
      final dir = await getApplicationSupportDirectory();
      _databaseInstance = await Isar.open(
        [ProjectSchema, ProjectTaskSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return _databaseInstance!;
  }
}
