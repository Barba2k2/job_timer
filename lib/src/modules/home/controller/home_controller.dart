import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../entities/project_status.dart';
import '../../../services/projects/project_service.dart';
import '../../../view_model/project_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  ProjectService _projectService;

  HomeController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(HomeState.initial());

  Future<void> loadProjects() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final projects = await _projectService.findByStatus(state.projectFilter);

      emit(
        state.copyWith(
          status: HomeStatus.complete,
          projects: projects,
        ),
      );
    } on Exception catch (e, s) {
      log('Erro ao carregar os projetos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}