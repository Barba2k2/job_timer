import 'package:job_timer/src/view_model/project_model.dart';

abstract interface class ProjectService {
  Future<void> register(ProjectModel projectModel);
}
