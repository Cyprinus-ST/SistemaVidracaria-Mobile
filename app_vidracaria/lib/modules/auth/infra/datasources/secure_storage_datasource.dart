import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';

abstract class SecureStorageDatasource {
  Future<void> storeUserAuthenticadedOnStorage(UserAuthenticaded user);
  Future<String> getTokenOfStorage();
  Future<User> getUserAuthenticaded();
  Future<bool> tokenIsValid();
  Future<User> doGetUser(String id, String token);
}