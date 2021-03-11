import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ListProject {
  Future<Either<FailureProject, List<Project>>> call(FilterProjectInput input);
}

class ListProjectImpl implements ListProject {
  final ProjectRepository repository;

  ListProjectImpl(this.repository);

  @override
  Future<Either<FailureProject, List<Project>>> call(FilterProjectInput input) async {
    return await repository.listProject(input);
  }
}