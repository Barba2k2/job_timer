import 'package:flutter_modular/flutter_modular.dart';

import 'detail/project_detail_module.dart';
import 'register/project_register_module.dart';
import 'tasks/task_module.dart';

class ProjectModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/register/',
          module: ProjectRegisterModule(),
        ),
        ModuleRoute(
          '/detail/',
          module: ProjectDetailModule(),
        ),
        ModuleRoute(
          '/task/',
          module: TaskModule(),
        ),
      ];
}
