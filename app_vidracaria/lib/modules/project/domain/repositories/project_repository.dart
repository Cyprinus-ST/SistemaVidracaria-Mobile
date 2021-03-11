import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/addProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/deleteProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/editProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/getProjectnput.dart';
import 'package:dartz/dartz.dart';

abstract class ProjectRepository {
  Future<Either<FailureProject, void>> addProject(AddProjectInput input);
  Future<Either<FailureProject, List<Project>>> listProject(FilterProjectInput input);
  Future<Either<FailureProject, void>> deleteProject(DeleteProjectInput input);
  Future<Either<FailureProject, Project>> getProject(GetProjectInput input);
  Future<Either<FailureProject, void>> editProject(EditProjectInput input);
}