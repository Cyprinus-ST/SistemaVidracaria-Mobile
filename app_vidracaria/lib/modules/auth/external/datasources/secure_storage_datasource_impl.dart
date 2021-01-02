import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageDatasourceImpl implements SecureStorageDatasource {
  final storage = new FlutterSecureStorage();

  @override
  Future<String> getTokenOfStorage() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<void> storeTokenOnStorage(String token) async {
    try {
      await storage.write(key: 'Bearer_JWT_token', value: token);
    } catch (e) {
      throw StorageTokenError();
    }
  }

}