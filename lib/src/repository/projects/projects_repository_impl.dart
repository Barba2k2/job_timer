import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/src/core/database/database.dart';
import 'package:job_timer/src/entities/project.dart';
import 'package:job_timer/src/repository/projects/projects_repository.dart';

import '../../core/exceptions/failure.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final Database _database;

  ProjectsRepositoryImpl({
    required Database database,
  }) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
      final conn = await _database.openConnection();

      await conn.writeTxn(
        () async => project.id = await conn.projects.put(project),
      );
    } on IsarError catch (e, s) {
      log('Erro ao cadastrar projeto', error: e, stackTrace: s);
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }
}
