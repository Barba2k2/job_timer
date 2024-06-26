import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_timer/src/view_model/project_model.dart';

import '../../../../services/projects/project_service.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  final ProjectService _projectService;

  ProjectDetailController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(
          const ProjectDetailState.initial(),
        );

  void setProject(ProjectModel projectModel) {
    emit(
      state.copyWith(
        projectModel: projectModel,
        status: ProjectDetailStatus.complete,
      ),
    );
  }

  Future<void> updateProject() async {
    final project = await _projectService.findById(state.projectModel!.id!);
    emit(
      state.copyWith(
        projectModel: project,
        status: ProjectDetailStatus.complete,
      ),
    );
  }

  Future<void> finishProject() async {
    try {
      emit(state.copyWith(status: ProjectDetailStatus.loading));

      final projectId = state.projectModel!.id!;

      await _projectService.finish(projectId);

      updateProject();
    } catch (e, s) {
      log('Erro ao finalizar projeto', error: e, stackTrace: s);
      emit(state.copyWith(status: ProjectDetailStatus.failure));
    }
  }
}
