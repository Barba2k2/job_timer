import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/src/modules/login/login_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'controller/login_controller.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.lazySingleton(
          //$ AuthService -> AppModule
          (i) => LoginController(authService: i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => LoginPage(
            controller: Modular.get(),
          ),
        ),
      ];
}
