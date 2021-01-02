import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:dartz/dartz.dart';

abstract class StoreUserToken {
  Future<Either<FailureAuthenticate, void>> call(String token);
}

class StorageUserTokenImpl implements StoreUserToken {
  final SecureStorageRepository repository;

  StorageUserTokenImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, void>> call(String token) async {
    if(validateInput(token)){
      return Left(InvalidTokenError());
    }
    return repository.storeToken(token);
  }

  bool validateInput(String token) {
    if(token == null || token == '') {
      return true;
    }
    return false;
  }
}
