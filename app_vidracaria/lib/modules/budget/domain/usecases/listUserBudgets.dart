import 'package:app_vidracaria/modules/budget/domain/entities/Budget.dart';
import 'package:app_vidracaria/modules/budget/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/listUserBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/repositories/budget_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ListUserBudgets {
  Future<Either<FailureBudget, List<Budget>>> call(
      ListUserBudgetsInput input);
}

class ListUserBudgetsImpl implements ListUserBudgets {
  final BudgetRepository repository;

  ListUserBudgetsImpl(this.repository);

  @override
  Future<Either<FailureBudget, List<Budget>>> call(
      ListUserBudgetsInput input) async {
    if (validateInput(input)){
      return Left(InvalidFieldsError());
    }
      return repository.listUserBudgets(input);
  }

  bool validateInput(ListUserBudgetsInput input) {
    if (input.id == null || input.id == '') {
      return true;
    }
    return false;
  }
}