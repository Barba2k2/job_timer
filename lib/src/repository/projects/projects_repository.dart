import 'package:job_timer/src/entities/project.dart';

abstract class ProjectsRepository {
  Future<void> register(Project project);
}
