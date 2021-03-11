import 'package:app_vidracaria/modules/costumer/infra/datasources/costumers_datasource.dart';
import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/addProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/deleteProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/editProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/getProjectnput.dart';
import 'package:app_vidracaria/modules/project/domain/repositories/project_repository.dart';
import 'package:app_vidracaria/modules/project/infra/datasources/project_datasource.dart';
import 'package:dartz/dartz.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDatasource datasource;

  ProjectRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureProject, void>> addProject(AddProjectInput input) async {
    try {
      return Right(await datasource.addProject(input));
    } on FailureProject catch (e) {
      return Left(e);
    } catch (e) {
      return left(DatasourceError());
    }
  }

  @override
  Future<Either<FailureProject, List<Project>>> listProject(FilterProjectInput input) async {
    try {
      return Right(await datasource.listProject(input));
    } on FailureProject catch(e) {
      return Left(e);
    }catch (e) {
      return left(DatasourceError());
    }
  }

  @override
  Future<Either<FailureProject, void>> deleteProject(DeleteProjectInput input) async {
    try {
      return Right(await datasource.deleteProject(input));
    } on FailureProject catch(e) {
      return Left(e);
    }catch (e) {
      return left(DatasourceError());
    }
  }

  @override
  Future<Either<FailureProject, Project>> getProject(GetProjectInput input) async {
    try {
      return Right(await datasource.getProject(input));
    } on FailureProject catch(e) {
      return Left(e);
    }catch (e) {
      return left(DatasourceError());
    }
  }

  @override
  Future<Either<FailureProject, void>> editProject(EditProjectInput input) async {
    try {
      return Right(await datasource.editProject(input));
    } on FailureProject catch(e) {
      return Left(e);
    }catch (e) {
      return left(DatasourceError());
    }
  }
}