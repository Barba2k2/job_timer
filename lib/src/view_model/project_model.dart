import 'package:job_timer/src/entities/project_status.dart';

import 'project_task_model.dart';

class ProjectModel {
  ProjectModel({
    required this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });

  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;
}
