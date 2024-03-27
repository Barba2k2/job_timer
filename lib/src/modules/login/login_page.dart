import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/src/modules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;

  const LoginPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return BlocListener<LoginController, LoginState>(
      bloc: controller,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          final message = state.errorMessage ?? 'Erro ao realizar login';
          AsukaSnackbar.alert(message).show();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0092B9),
                Color(0xFF0167B2),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: sizeOf.height * .02,
                ),
                SizedBox(
                  width: sizeOf.width * .8,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.99),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      controller.signIn();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset('assets/images/google.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Login com o Google',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                BlocSelector<LoginController, LoginState, bool>(
                  bloc: controller,
                  selector: (state) => state.status == LoginStatus.loading,
                  builder: (context, show) {
                    return Visibility(
                      visible: show,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                            strokeWidth: 6,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
