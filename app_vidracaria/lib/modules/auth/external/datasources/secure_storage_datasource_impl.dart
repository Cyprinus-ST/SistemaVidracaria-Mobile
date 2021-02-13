import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageDatasourceImpl implements SecureStorageDatasource {
  
  static const _KEY = "Bearer_JWT_token";
  final storage = new FlutterSecureStorage(); 
  
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

}