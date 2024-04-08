part of 'project_detail_controller.dart';

enum ProjectDetailStatus {
  initial,
  loading,
  complete,
  failure;
}

class ProjectDetailState {
  final ProjectDetailStatus status;
  final ProjectModel? projectModel;

  const ProjectDetailState._({
    this.status = ProjectDetailStatus.initial,
    this.projectModel,
  });

  const ProjectDetailState.initial() : this._(status: ProjectDetailStatus.initial);

  ProjectDetailState copyWith({
    ProjectDetailStatus? status,
    ProjectModel? projectModel,
  }) {
    return ProjectDetailState._(
      status: status ?? this.status,
      projectModel: projectModel ?? this.projectModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        projectModel,
      ];
}
