import 'package:app_vidracaria/modules/budget/domain/entities/Budget.dart';

abstract class BudgetDataSource {
  Future<List<Budget>> doListUserBudgets(String userId);
  Future<List<Budget>> doListBudgets();
  Future<Budget> doGetBudget(String id);
  Future<void> doAddBudget(Budget budget);
  Future<void> doDeleteBudget(String id);
  Future<void> doEditBudget(Budget budget);
}