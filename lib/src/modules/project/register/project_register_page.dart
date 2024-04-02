import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/app_config_ui.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({super.key});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Criar novo projeto',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameEC,
                validator:
                    Validatorless.required('Nome do projeto é obrigatório'),
                decoration: const InputDecoration(
                  label: Text('Nome do projeto'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: Validatorless.multiple(
                  [
                    Validatorless.required('Estimativa de horas é obrigatória'),
                    Validatorless.number('Permitido somente números'),
                  ],
                ),
                keyboardType: TextInputType.number,
                controller: _estimateEC,
                decoration: const InputDecoration(
                  label: Text('Estimativa de horas'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConfigUI.theme.primaryColor,
                  ),
                  onPressed: () {
                    final formValid = _formKey.currentState?.validate();
                    if (formValid!) {}
                  },
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
