import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/repositories/costumers_repository.dart';
import 'package:dartz/dartz.dart';

abstract class AddCostumer {
  Future<Either<FailureCostumer, void>> call(AddCostumerInput input);
}

class AddCostumerImpl implements AddCostumer {
  final CostumersRepository repository;

  AddCostumerImpl(this.repository);

  @override
  Future<Either<FailureCostumer, void>> call(AddCostumerInput input) async {
    if (validateInput(input)) {
      return Left(InvalidFieldsError());
    }
    return Right(await repository.addClient(input));
  }

  bool validateInput(AddCostumerInput input) {
    if (input.name == null ||
        input.name == '' ||
        input.email == null ||
        input.email == '' ||
        input.phone == null ||
        input.phone == '') {
      return true;
    }
    return false;
  }
}
