import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/deleteCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/repositories/costumers_repository.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteCostumer {
  Future<Either<FailureCostumer, void>> call(DeleteCostumerInput input);
}

class DeleteCostumerImpl implements DeleteCostumer {
  final CostumersRepository repository;

  DeleteCostumerImpl(this.repository);

  @override
  Future<Either<FailureCostumer, void>> call(DeleteCostumerInput input) async {
    if (validateInput(input)) {
      return Left(InvalidFieldsError());
    }
    return Right(await repository.deleteCostumer(input));
  }

  bool validateInput(DeleteCostumerInput input) {
    if (input.id == null ||
        input.id == '') {
      return true;
    }
    return false;
  }
}
