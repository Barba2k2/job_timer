import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'controller/project_register_controller.dart';
import 'project_register_page.dart';

class ProjectRegisterModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => ProjectRegisterPage(
            controller: Modular.get(),
          ),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton(
          (i) => ProjectRegisterController(
            projectService: i(),
          ),
        ),
      ];
}
