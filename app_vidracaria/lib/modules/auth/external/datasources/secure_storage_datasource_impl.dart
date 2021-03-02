import 'dart:convert';

import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SecureStorageDatasourceImpl implements SecureStorageDatasource {
  
  static const _KEY_TOKEN = "Bearer_JWT_token";
  static const _KEY_USER = "User_Authenticaded";

  final storage = new FlutterSecureStorage(); 
  final tokenValidate = new JwtDecoder();

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
      return User.fromJson(userMap);
    } catch (e) {
      throw GetTokenError();
    }
  }

  @override
  Future<void> storeUserAuthenticadedOnStorage(UserAuthenticaded user) async {
    try {
      var stringUser = jsonEncode(user.user);
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
}