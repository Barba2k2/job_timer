import 'dart:developer';

import '../../entities/project.dart';
import '../../entities/project_status.dart';
import '../../entities/project_task.dart';
import '../../repository/projects/projects_repository.dart';
import '../../view_model/project_model.dart';
import '../../view_model/project_task_model.dart';
import './project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectsRepository _projectsRepository;

  ProjectServiceImpl({
    required ProjectsRepository projectsRepository,
  }) : _projectsRepository = projectsRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    try {
      final project = Project()
        ..name = projectModel.name
        ..status = projectModel.status
        ..estimate = projectModel.estimate
        ..userId = projectModel.userId;

      if (projectModel.id != null) {
        project.id = projectModel.id!;
      }

      await _projectsRepository.register(project);
    } catch (e, s) {
      log('Erro ao registrar projeto', error: e, stackTrace: s);
    }
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectsRepository.findByStatus(status);

    return projects.map(ProjectModel.fromEntity).toList();
  }

  @override
  Future<ProjectModel> addTask(int projectId, ProjectTaskModel task) async {
    final projectTask = ProjectTask()
      ..name = task.name
      ..duration = task.duration;

    final project = await _projectsRepository.addTask(projectId, projectTask);

    return ProjectModel.fromEntity(project);
  }

  @override
  Future<ProjectModel> findById(int projectId) async {
    final project = await _projectsRepository.findById(projectId);

    return ProjectModel.fromEntity(project);
  }
  
  @override
  Future<void> finish(int projectId) => _projectsRepository.finish(projectId);
  
  
}
