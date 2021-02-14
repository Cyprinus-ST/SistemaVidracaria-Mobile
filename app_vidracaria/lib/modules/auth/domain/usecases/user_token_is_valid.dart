import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/auth_repository.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UserTokenIsValid {
  Future<Either<FailureAuthenticate, bool>> call(String token);
}

class UserTokenIsValidImpl implements UserTokenIsValid {
  final SecureStorageRepository repository;

  UserTokenIsValidImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, bool>> call(String token) async {
    if(_validateInput(token)) {
      throw Left(FailureAuthenticate);
    }
    return await repository.tokenIsValid(token);
  }

  bool _validateInput(String token) {
    if(token.isEmpty || token == null){
      return true;
    }
    return false;
  }
}