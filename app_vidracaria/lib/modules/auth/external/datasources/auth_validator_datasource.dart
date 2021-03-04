import 'dart:convert';

import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/register_input.dart';
import 'package:app_vidracaria/modules/auth/domain/util/parsed_response.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:app_vidracaria/modules/config/environment.dart';
import 'package:http/http.dart';

class AuthDatasourceImpl implements AuthDataSource {
  final Client client;

  AuthDatasourceImpl(this.client);

  @override
  Future<UserAuthenticaded> doAuthenticateUser(
      String email, String password) async {
    final body = jsonEncode({"Email": email, "Password": password});

    final response = await client.post(Environment.URL + "Login",
        body: body,
        headers: {"Accept": "*/*", "content-type": "application/json"});

    final data = ParserResponse.doParserResponse(response);
    return UserAuthenticaded.fromJson(data);
  }

  @override
  Future<void> doForgotPassword(String email) async {
    final url = "Login/forgotPassword?Email=" + email;
    final response = await client.put(Environment.URL + url);

    ParserResponse.doParserResponse(response);
  }

  @override
  Future<void> doRegisterUser(RegisterInput input) async {
    final url = "Login/register";
    final response = await client.post(Environment.URL+url);
    
    ParserResponse.doParserResponse(response);
  }
}
