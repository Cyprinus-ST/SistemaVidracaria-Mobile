import 'package:app_vidracaria/modules/project/domain/entities/ProjectType.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';

abstract class AddProjectState {}

class AddProjectStart implements AddProjectState {}

class AddProjectLoading implements AddProjectState {}

class AddProjectError implements AddProjectState {
  final FailureProject error;

  AddProjectError(this.error);
}

class AddProjectSuccess implements AddProjectState {
  final List<ProjectType> types;

  AddProjectSuccess(this.types); 
}