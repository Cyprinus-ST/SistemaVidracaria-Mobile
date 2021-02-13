import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/register_input.dart';

abstract class AuthDataSource {
  Future<UserAuthenticaded> doAuthenticateUser(String email, String password);
  Future<void> doForgotPassword(String email);
  Future<void> doRegisterUser(RegisterInput input);
}