// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/src/modules/home/widgets/project_tile.dart';

import '../../view_model/project_model.dart';
import 'controller/home_controller.dart';
import 'widgets/header_projects_menu.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          AsukaSnackbar.alert('Erro ao buscar projetos').show();
        }
      },
      child: Scaffold(
        drawer: const Drawer(
          child: SafeArea(
            child: ListTile(
              title: Text('Sair'),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.blue,
              title: Text('Projetos'),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(controller: controller),
              pinned: true,
            ),
            BlocSelector<HomeController, HomeState, bool>(
              bloc: controller,
              selector: (state) {
                return state.status == HomeStatus.loading;
              },
              builder: (context, showLoading) {
                return SliverVisibility(
                  visible: showLoading,
                  sliver: const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocSelector<HomeController, HomeState, List<ProjectModel>>(
              bloc: controller,
              selector: (state) => state.projects,
              builder: (context, projects) {
                return SliverList(
                  delegate: SliverChildListDelegate(
                    projects
                        .map(
                          (project) => ProjectTile(projectModel: project),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
