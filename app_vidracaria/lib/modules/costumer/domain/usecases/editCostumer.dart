import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/editCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/repositories/costumers_repository.dart';
import 'package:dartz/dartz.dart';

abstract class EditCostumer {
  Future<Either<FailureCostumer, void>> call(EditCostumerInput input);
}

class EditCostumerImpl implements EditCostumer {
  final CostumersRepository repository;

  EditCostumerImpl(this.repository);

  @override
  Future<Either<FailureCostumer, void>> call(EditCostumerInput input) async {
    if (validateInput(input)) {
      return Left(InvalidFieldsError());
    }
    return Right(await repository.editCostumer(input));
  }

  bool validateInput(EditCostumerInput input) {
    if (input.name == null ||
        input.name == '' ||
        input.email == null ||
        input.email == '' ||
        input.phone == null ||
        input.phone == '' ||
        input.idUser == '' ||
        input.idUser == null) {
      return true;
    }
    return false;
  }
}