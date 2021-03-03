import 'package:app_vidracaria/modules/budget/domain/inputs/getBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/deleteBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/listUserBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/editBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/inputs/addBudgetInput.dart';
import 'package:app_vidracaria/modules/budget/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/budget/domain/entities/Budget.dart';
import 'package:app_vidracaria/modules/budget/domain/repositories/budget_repository.dart';
import 'package:app_vidracaria/modules/budget/infra/datasources/budget_datasource.dart';
import 'package:dartz/dartz.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetDataSource datasource;

  BudgetRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureBudget, void>> addBudget(AddBudgetInput input) {
      // TODO: implement addBudget
      throw UnimplementedError();
    }
  
    @override
    Future<Either<FailureBudget, void>> deleteBudget(DeleteBudgetInput input) {
      // TODO: implement deleteBudget
      throw UnimplementedError();
    }
  
    @override
    Future<Either<FailureBudget, void>> editBudget(EditBudgetInput input) {
      // TODO: implement editBudget
      throw UnimplementedError();
    }
  
    @override
    Future<Either<FailureBudget, void>> getBudget(GetBudgetInput input) {
      // TODO: implement getBudget
      throw UnimplementedError();
    }
  
    @override
    Future<Either<FailureBudget, List<Budget>>> listBudgets() {
      // TODO: implement listBudgets
      throw UnimplementedError();
    }
  
    @override
    Future<Either<FailureBudget, List<Budget>>> listUserBudgets(ListUserBudgetsInput userId) {
    // TODO: implement listUserBudgets
    throw UnimplementedError();
  }

 
}