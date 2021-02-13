import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/forgot_password_input.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ForgotPassword {
  Future<Either<FailureAuthenticate, void>> call(ForgotPasswordInput input);
}

class ForgotPasswordImpl implements ForgotPassword {
  final AuthRepository repository;

  ForgotPasswordImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, void>> call(ForgotPasswordInput input) async {
    if(_validateInput(input)){
      throw Left(FailureAuthenticate);
    }
    await repository.forgotPassword(input.email);
  }

  bool _validateInput(ForgotPasswordInput input) {
    if(input.email.isEmpty || input.email == null) {
      return true;
    }
    return false;
  }
}