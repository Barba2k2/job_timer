import '../../entities/project.dart';
import '../../entities/project_status.dart';

abstract class ProjectsRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatus status);
}
