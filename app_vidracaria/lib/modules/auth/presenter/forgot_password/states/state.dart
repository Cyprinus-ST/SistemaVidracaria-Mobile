import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';

abstract class ForgotPasswordState {

}

class ForgotPasswordSuccess implements ForgotPasswordState {

}

class ForgotPasswordStart implements ForgotPasswordState {

}

class ForgotPasswordLoading implements ForgotPasswordState {

}

class ForgotPasswordError implements ForgotPasswordState {
  final FailureAuthenticate error;

  ForgotPasswordError(this.error);
}