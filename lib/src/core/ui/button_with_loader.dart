import 'package:flutter/material.dart';

import 'app_config_ui.dart';

class ButtonWithLoader extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  
  const ButtonWithLoader({
    super.key,
    required this.onPressed, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConfigUI.theme.primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
