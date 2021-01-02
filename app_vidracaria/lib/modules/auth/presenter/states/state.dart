import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';

abstract class LoginState {
  
}

class LoginSuccess implements LoginState {
  final UserAuthenticaded authUser;

  LoginSuccess(this.authUser);
}

class LoginStart implements LoginState {}

class LoginLoading implements LoginState {}

class LoginError implements LoginState {
  final FailureAuthenticate error;

  LoginError(this.error);
}

