import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetUserToken {
  Future<Either<FailureAuthenticate, String>> call();
}

class GetUserTokenImpl implements GetUserToken {
  final SecureStorageRepository repository;

  GetUserTokenImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, String>> call() {
    return repository.getToken();
  }

}