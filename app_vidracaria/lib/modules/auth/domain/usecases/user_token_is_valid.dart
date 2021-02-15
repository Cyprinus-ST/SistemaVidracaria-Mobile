import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UserTokenIsValid {
  Future<Either<FailureAuthenticate, bool>> call();
}

class UserTokenIsValidImpl implements UserTokenIsValid {
  final SecureStorageRepository repository;

  UserTokenIsValidImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, bool>> call() async {
    return await repository.tokenIsValid();
  }
}