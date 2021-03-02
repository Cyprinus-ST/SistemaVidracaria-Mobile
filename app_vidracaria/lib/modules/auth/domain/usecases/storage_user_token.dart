import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:dartz/dartz.dart';

abstract class StoreUserAuthenticaded {
  Future<Either<FailureAuthenticate, void>> call(UserAuthenticaded user);
}

class StoreUserAuthenticadedImpl implements StoreUserAuthenticaded {
  final SecureStorageRepository repository;

  StoreUserAuthenticadedImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, void>> call(UserAuthenticaded user) async {
    if(validateInput(user.acessToken)){
      return Left(InvalidTokenError());
    }
    return repository.storeUserAuthenticaded(user);
  }

  bool validateInput(String token) {
    if(token == null || token == '') {
      return true;
    }
    return false;
  }
}
