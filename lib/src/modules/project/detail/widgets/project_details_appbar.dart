// ignore_for_file: depend_on_referenced_packages, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/src/entities/project_status.dart';

import '../../../../view_model/project_model.dart';
import '../controller/project_detail_controller.dart';

class ProjectDetailsAppbar extends SliverAppBar {
  ProjectDetailsAppbar({required ProjectModel projectModel, super.key})
      : super(
          expandedHeight: 100,
          pinned: true,
          toolbarHeight: 100,
          title: Text(
            projectModel.name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Align(
                alignment: const Alignment(0, 1.6),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${projectModel.tasks.length} Tasks'),
                          Visibility(
                            visible:
                                projectModel.status != ProjectStatus.finalizado,
                            replacement: const Text('Projeto finalizado!'),
                            child: _NewTasks(
                              projectModel: projectModel,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
}

class _NewTasks extends StatelessWidget {
  final ProjectModel projectModel;

  const _NewTasks({
    required this.projectModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to.pushNamed('/project/task/', arguments: projectModel);
        Modular.get<ProjectDetailController>().updateProject();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
              ),
            ),
          ),
          const Text('Adicionar Task')
        ],
      ),
    );
  }
}
