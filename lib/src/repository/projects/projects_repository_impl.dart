import 'dart:developer';

import 'package:isar/isar.dart';

import '../../core/database/database.dart';
import '../../core/exceptions/failure.dart';
import '../../entities/project.dart';
import '../../entities/project_status.dart';
import '../../entities/project_task.dart';
import 'projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final Database _database;

  ProjectsRepositoryImpl({
    required Database database,
  }) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
      final conn = await _database.openConnection();

      await conn.writeTxn(() {
        return conn.projects.put(project);
      });
    } on IsarError catch (e, s) {
      log('Erro ao cadastrar projeto', error: e, stackTrace: s);
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    final conn = await _database.openConnection();

    final projects =
        await conn.projects.filter().statusEqualTo(status).findAll();

    return projects;
  }

  @override
  Future<Project> addTask(int projectId, ProjectTask task) async {
    final conn = await _database.openConnection();

    final project = await findById(projectId);

    project.tasks.add(task);

    // await conn.writeTxn(() => project.tasks.save());
    await conn.writeTxn(() async {
      await conn.projectTasks.put(task);
      project.tasks.add(task);
      return project.tasks.save();
    });

    return project;
  }

  @override
  Future<Project> findById(int projectId) async {
    final conn = await _database.openConnection();

    final project = await conn.projects.get(projectId);

    if (project == null) {
      throw Failure(message: 'Projeto não encontrado');
    }

    return project;
  }

  @override
  Future<void> finish(int projectId) async {
    try {
      final conn = await _database.openConnection();

      final project = await findById(projectId);

      project.status = ProjectStatus.finalizado;

      await conn.writeTxn(
        () => conn.projects.put(
          project,
        ),
      );
    } on IsarError catch (e, s) {
      log('Erro ao finalizar projeto', error: e, stackTrace: s);
      throw Failure(message: 'Erro ao finalizar projeto');
    }
  }
}
