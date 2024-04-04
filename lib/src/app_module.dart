import 'package:flutter_modular/flutter_modular.dart';
import 'modules/project/project_module.dart';
import 'repository/projects/projects_repository.dart';
import 'repository/projects/projects_repository_impl.dart';
import 'services/projects/project_service_impl.dart';

import 'core/database/database.dart';
import 'core/database/database_impl.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash.page.dart';
import 'services/auth/auth_service.dart';
import 'services/auth/auth_service_impl.dart';
import 'services/projects/project_service.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthService>(
          (i) => AuthServiceImpl(),
        ),
        Bind.lazySingleton<Database>(
          (i) => DatabaseImpl(),
        ),
        Bind.lazySingleton<ProjectsRepository>(
          (i) => ProjectsRepositoryImpl(
            database: i(),
          ),
        ),
        Bind.lazySingleton<ProjectService>(
          (i) => ProjectServiceImpl(
            projectsRepository: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SplashPage()),
        ModuleRoute('/login/', module: LoginModule()),
        ModuleRoute('/home/', module: HomeModule()),
        ModuleRoute('/project/', module: ProjectModule()),
      ];
}
