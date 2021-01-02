import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';

abstract class AuthDataSource {
  Future<UserAuthenticaded> doAuthenticateUser(String email, String password);
}