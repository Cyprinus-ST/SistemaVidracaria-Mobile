import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetUserAuthenticaded {
  Future<Either<FailureAuthenticate, User>> call();
}

class GetUserAuthenticadedImpl implements GetUserAuthenticaded {
  final SecureStorageRepository repository;

  GetUserAuthenticadedImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, User>> call() {
    return repository.getUserAuthenticaded();
  }

}