import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';

abstract class ProjectState {}

class ProjectStart implements ProjectState {}

class ProjectLoading implements ProjectState {}

class ProjectError implements ProjectState {
  final FailureProject error;

  ProjectError(this.error);
}

class ProjectSuccess implements ProjectState {
  final List<Project> projects;

  ProjectSuccess(this.projects);
  
}