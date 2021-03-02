import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SecureStorageRepository {
  Future<Either<FailureAuthenticate, void>> storeUserAuthenticaded(UserAuthenticaded user);
  Future<Either<FailureAuthenticate, String>> getToken();
  Future<Either<FailureAuthenticate, User>> getUserAuthenticaded();
  Future<Either<FailureAuthenticate, bool>> tokenIsValid();
}