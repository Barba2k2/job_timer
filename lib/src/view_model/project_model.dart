import '../entities/project.dart';
import '../entities/project_status.dart';

import 'project_task_model.dart';

class ProjectModel {
  ProjectModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
    required this.userId,
  });

  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;

  final List<ProjectTaskModel> tasks;

  final String userId;

  factory ProjectModel.fromEntity(Project project) {
    project.tasks.loadSync();

    return ProjectModel(
      id: project.id,
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      userId: project.userId,
      tasks: project.tasks.map((e) => ProjectTaskModel.fromEntity(e)).toList(),
    );
  }
}
