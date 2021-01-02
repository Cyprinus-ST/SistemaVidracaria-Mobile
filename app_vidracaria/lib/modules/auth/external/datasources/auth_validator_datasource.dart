import 'dart:convert';

import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:app_vidracaria/modules/auth/infra/models/user_authenticaded_model.dart';
import 'package:http/http.dart';

class AuthDatasourceImpl implements AuthDataSource {
  final Client client;

  AuthDatasourceImpl(this.client);

  @override
  Future<UserAuthenticaded> doAuthenticateUser(
      String email, String password) async {
    final body = jsonEncode({"email": email, "senha": password});
    final response = await client.post("http://10.0.0.105:5000/api/Login",
        body: body,
        headers: {"Accept": "*/*", "content-type": "application/json"});
    switch (response.statusCode) {
      case 200:
        Map data = jsonDecode(response.body);
        return UserAuthenticadedModel.fromJson(data);
      case 401:
        print("deu 401 ruim");
        throw DataSourceError();
      case 500:
        print("deu 500 ruim");
        throw DataSourceError();
      default:
        throw DataSourceError();
    }
  }
}
