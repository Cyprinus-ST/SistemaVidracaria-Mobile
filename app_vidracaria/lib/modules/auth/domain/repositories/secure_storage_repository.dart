import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SecureStorageRepository {
  Future<Either<FailureAuthenticate, void>> storeToken(String token);
  Future<Either<FailureAuthenticate, String>> getToken();
  Future<Either<FailureAuthenticate, bool>> tokenIsValid(String token);
}