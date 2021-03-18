import 'dart:convert';

import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/util/parsed_response.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:app_vidracaria/modules/config/environment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SecureStorageDatasourceImpl implements SecureStorageDatasource {
  
  static const _KEY_TOKEN = "Bearer_JWT_token";
  static const _KEY_USER = "User_Authenticaded";

  final storage = new FlutterSecureStorage(); 
  final tokenValidate = new JwtDecoder();
  final Client client;

  SecureStorageDatasourceImpl({this.client});

  @override
  Future<String> getTokenOfStorage() async {
    try {
      return await storage.read(key: _KEY_TOKEN);
    } catch (e) {
      throw GetTokenError();
    }
  }

  @override
  Future<User> getUserAuthenticaded() async {
    try {
      final stringUser = await storage.read(key: _KEY_USER);
      final userMap = jsonDecode(stringUser);
      final user = User.fromJson(userMap);
      return user;
    } catch (e) {
      throw GetTokenError();
    }
  }

  @override
  Future<void> storeUserAuthenticadedOnStorage(UserAuthenticaded user) async {
    try {
      final result = await doGetUser(user.user.id, user.acessToken);
      var stringUser = jsonEncode(result);
      await storage.write(key: _KEY_TOKEN, value: user.acessToken);
      await storage.write(key: _KEY_USER, value: stringUser);
    } catch (e) {
      throw StorageTokenError();
    }
  }

  @override
  Future<bool> tokenIsValid() async {
    try {
      final token = await getTokenOfStorage();
      final result = JwtDecoder.isExpired(token);
      return result;
    } catch (e) {
      throw InvalidTokenError();
    }
  }

  @override
  Future<User> doGetUser(String id, String token) async {
    final url = "User/" + id;
    final response = await client.get(Environment.URL + url,
        headers: Environment.headers(token));
    
    final data = ParserResponse.doParserResponse(response);
    final user = User.fromJson(data);
    return user;
  }
}