import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/deleteProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteProject {
  Future<Either<FailureProject, void>> call(DeleteProjectInput input);
}

class DeleteProjectImpl implements DeleteProject {
  final ProjectRepository repository;

  DeleteProjectImpl(this.repository);

  @override
  Future<Either<FailureProject, void>> call(DeleteProjectInput input) async {
    if(_validateInput(input)){
      return Left(InvalidFieldsError());
    }
    return Right(await repository.deleteProject(input));
  }

  bool _validateInput(DeleteProjectInput input) {
    if (input.id == '' || input.id == null) {
      return true;
    }
    return false;
  }
}