import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/entities/ProjectType.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';

abstract class ProjectState {}

abstract class ProjectTypeState {}

class ProjectStart implements ProjectState {}

class ProjectLoading implements ProjectState {}

class ProjectError implements ProjectState {
  final FailureProject error;

  ProjectError(this.error);
}

class ProjectSuccess implements ProjectState {
  final List<Project> projects;
  final List<ProjectType> types;

  ProjectSuccess(this.projects, { this.types }); 
}

class ProjectTypeSuccess implements ProjectTypeState {
  final List<ProjectType> types;

  ProjectTypeSuccess(this.types);
}

class ProjectTypeLoading implements ProjectTypeState {}

class ProjectTypeStart implements ProjectTypeState {}

class ProjectTypeError implements ProjectTypeState {
  final FailureProject error;

  ProjectTypeError(this.error);
}