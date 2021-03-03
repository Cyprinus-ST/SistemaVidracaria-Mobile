import 'package:app_vidracaria/modules/budget/domain/entities/Budget.dart';
import 'package:app_vidracaria/modules/budget/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/addBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/deleteBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/editBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/getBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/listUserBudgetInput.dart';
import 'package:dartz/dartz.dart';

abstract class BudgetRepository {
  Future<Either<FailureBudget, List<Budget>>> listUserBudgets(ListUserBudgetsInput userId);
  Future<Either<FailureBudget, List<Budget>>> listBudgets();
  Future<Either<FailureBudget, void>> getBudget(GetBudgetInput input);
  Future<Either<FailureBudget, void>> addBudget(AddBudgetInput input);
  Future<Either<FailureBudget, void>> editBudget(EditBudgetInput input);
  Future<Either<FailureBudget, void>> deleteBudget(DeleteBudgetInput input);
}