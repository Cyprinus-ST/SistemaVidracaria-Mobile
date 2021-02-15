import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SecureStorageDatasourceImpl implements SecureStorageDatasource {
  
  static const _KEY = "Bearer_JWT_token";
  final storage = new FlutterSecureStorage(); 
  final tokenValidate = new JwtDecoder();

  @override
  Future<String> getTokenOfStorage() async {
    try {
      return await storage.read(key: _KEY);
    } catch (e) {
      throw GetTokenError();
    }
  }

  @override
  Future<void> storeTokenOnStorage(String token) async {
    try {
      await storage.write(key: _KEY, value: token);
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