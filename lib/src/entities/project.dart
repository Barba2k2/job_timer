import 'package:isar/isar.dart';

import 'project_status.dart';
import 'project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
  Id id = Isar.autoIncrement;
  late String name;
  @enumerated
  late ProjectStatus status;
  late int estimate;
  final tasks = IsarLinks<ProjectTask>();
  late String userId;
}
