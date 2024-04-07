import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_config_ui.dart';

class ButtonWithLoader<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final VoidCallback onPressed;
  final String label;

  const ButtonWithLoader({
    super.key,
    required this.selector,
    required this.bloc,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // style: ElevatedButton.styleFrom(
      //   backgroundColor: AppConfigUI.theme.primaryColor,
      // ),
      onPressed: onPressed,
      child: BlocSelector<B, S, bool>(
        bloc: bloc,
        selector: selector,
        builder: (context, showLoading) {
          if (!showLoading) {
            return Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            );
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
