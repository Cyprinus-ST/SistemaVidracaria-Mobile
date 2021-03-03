import 'package:app_vidracaria/modules/auth/domain/util/parsed_response.dart';
import 'package:app_vidracaria/modules/auth/infra/config/environment.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:app_vidracaria/modules/budget/domain/entities/Budget.dart';
import 'package:app_vidracaria/modules/budget/infra/datasources/budget_datasource.dart';
import 'package:http/http.dart';

class BudgetDatasourceImpl implements BudgetDataSource {
  final Client client;
  final SecureStorageDatasource secureStorageDatasource;

  BudgetDatasourceImpl(this.client, this.secureStorageDatasource);

  @override
  Future<List<Budget>> doAddBudget(Budget budget) {
    // TODO: implement doAddBudget
    throw UnimplementedError();
  }

  @override
  Future<List<Budget>> doListBudgets() async {
    final String token = await secureStorageDatasource.getTokenOfStorage();

    final response = await client.get(Environment.URL + "Budget", headers: {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    });

    final data = ParserResponse.doParserResponse(response);

    final budgets = <Budget>[];
    for (final budget in data) {
      budgets.add(Budget.fromJson(budget));
    }
    return budgets;
  }

  @override
  Future<List<Budget>> doListUserBudgets(String userId) async {
    final String token = await secureStorageDatasource.getTokenOfStorage();

    final response = await client.get(Environment.URL + "Budget" + "idUser=" + userId, headers: {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    });

    final data = ParserResponse.doParserResponse(response);

    final budgets = <Budget>[];
    for (final budget in data) {
      budgets.add(Budget.fromJson(budget));
    }
    return budgets;
  }

  @override
  Future<void> doDeleteBudget(String id) async {
    final String token = await secureStorageDatasource.getTokenOfStorage();

    final response =
        await client.delete(Environment.URL + "Budget" + "?id=" + id, headers: {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    });

    ParserResponse.doParserResponse(response);
  }

  @override
  Future<void> doEditBudget(Budget budget) async {
    final String token = await secureStorageDatasource.getTokenOfStorage();

    final response = await client.put(Environment.URL + "Budget", headers: {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    },
    body: budget.toJson());

    ParserResponse.doParserResponse(response);
  }

  @override
  Future<Budget> doGetBudget(String id) async {
    final String token = await secureStorageDatasource.getTokenOfStorage();
    
    final response = await client.get(Environment.URL + "Budget/"+id,
        headers: {"Accept": "*/*", "content-type": "application/json", "Authorization": "Bearer " + token});

    final data = ParserResponse.doParserResponse(response);

    return Budget.fromJson(data);
  }
}
