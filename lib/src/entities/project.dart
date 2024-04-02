import 'package:isar/isar.dart';
import 'package:job_timer/src/entities/converters/project_status_converter.dart';
import 'package:job_timer/src/entities/project_status.dart';

import 'project_task.dart';

// part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;

  late String name;
  @ProjectStatusConverter()
  late ProjectStatus status;

  final tasks = IsarLinks<ProjectTask>();
}
