import 'package:app_vidracaria/modules/project/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/addProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

abstract class AddProject {
  Future<Either<FailureProject, void>> call(AddProjectInput input);
}

class AddProjectImpl implements AddProject {
  final ProjectRepository repository;
  
  AddProjectImpl(this.repository);

  @override
  Future<Either<FailureProject, void>> call(AddProjectInput input) async {
    if(_validateInput(input)){
      return Left(InvalidFieldsError());
    }
    return Right(await repository.addProject(input));
  }

  bool _validateInput(AddProjectInput input) {
    if (input.title == null ||
        input.title == '' ||
        input.description == null ||
        input.description == '' ||
        input.numberGlass == null ||
        input.projectType == null) {
      return true;
    }
    return false;

  }
}