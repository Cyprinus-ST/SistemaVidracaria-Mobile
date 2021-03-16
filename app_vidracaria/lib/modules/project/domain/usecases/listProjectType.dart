import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/entities/ProjectType.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ListProjectType {
  Future<Either<FailureProject, List<ProjectType>>> call();
}

class ListProjectTypeImpl implements ListProjectType {
  final ProjectRepository repository;

  ListProjectTypeImpl(this.repository);

  @override
  Future<Either<FailureProject, List<ProjectType>>> call() async {
    return await repository.listTypeProject();
  }
}