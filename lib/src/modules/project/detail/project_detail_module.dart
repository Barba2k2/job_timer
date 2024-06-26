import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import '../../../view_model/project_model.dart';
import 'controller/project_detail_controller.dart';
import 'project_detail_page.dart';

class ProjectDetailModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton(
          (i) => ProjectDetailController(
            projectService: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) {
            final ProjectModel projectModel = args.data;

            return ProjectDetailPage(
              controller: Modular.get()..setProject(projectModel),
            );
          },
        ),
      ];
}
