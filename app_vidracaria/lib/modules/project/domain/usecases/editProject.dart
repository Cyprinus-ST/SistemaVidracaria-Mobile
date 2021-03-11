import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/editProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

abstract class EditProject {
  Future<Either<FailureProject, void>> call(EditProjectInput input);
}

class GetProjectImpl implements EditProject {
  final ProjectRepository repository;

  GetProjectImpl(this.repository);

  @override
  Future<Either<FailureProject, void>> call(EditProjectInput input) async {
    if(_validateInput(input)){
      return Left(InvalidFieldsError());
    }
    return await repository.editProject(input);
  }

  bool _validateInput(EditProjectInput input) {
    if (input.id == '' || input.id == null) {
      return true;
    }
    return false;
  }
}