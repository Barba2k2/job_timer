// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'firebase_options.dart';
import 'src/app_module.dart';
import 'src/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
