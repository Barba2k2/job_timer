import 'dart:developer';

import 'package:isar/isar.dart';

import '../../core/database/database.dart';
import '../../core/exceptions/failure.dart';
import '../../entities/project.dart';
import '../../entities/project_status.dart';
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
}
