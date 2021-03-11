import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/getProjectnput.dart';
import 'package:app_vidracaria/modules/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetProject {
  Future<Either<FailureProject, Project>> call(GetProjectInput input);
}

class GetProjectImpl implements GetProject {
  final ProjectRepository repository;

  GetProjectImpl(this.repository);

  @override
  Future<Either<FailureProject, Project>> call(GetProjectInput input) async {
    if(_validateInput(input)){
      return Left(InvalidFieldsError());
    }
    return await repository.getProject(input);
  }

  bool _validateInput(GetProjectInput input) {
    if (input.id == '' || input.id == null) {
      return true;
    }
    return false;
  }
}