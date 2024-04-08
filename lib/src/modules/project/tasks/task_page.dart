import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/button_with_loader.dart';
import 'controller/task_controller.dart';

class TaskPage extends StatefulWidget {
  final TaskController controller;

  const TaskPage({
    super.key,
    required this.controller,
  });

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _durationEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _durationEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskController, TaskStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state == TaskStatus.sucess) {
          Navigator.pop(context);
        } else if (state == TaskStatus.failure) {
          AsukaSnackbar.alert('Erro ao registrar a Task').show();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Criar nova Task'),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEC,
                  decoration: const InputDecoration(
                    labelText: 'Nome da task',
                  ),
                  validator:
                      Validatorless.required('Nome da Task é obrigatório'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _durationEC,
                  decoration: const InputDecoration(
                    labelText: 'Duração da task',
                  ),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Duração da Task é obrigatório'),
                      Validatorless.number(
                          'Duração da Task deve ser um número'),
                    ],
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ButtonWithLoader<TaskController, TaskStatus>(
                    bloc: widget.controller,
                    selector: (state) => state == TaskStatus.loading,
                    label: 'Salvar',
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        final duration = int.parse(_durationEC.text);

                        widget.controller.register(
                          _nameEC.text,
                          duration,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
