import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:dartz/dartz.dart';

class SecureStorageRepositoryImpl implements SecureStorageRepository {
  final SecureStorageDatasource datasource;

  SecureStorageRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureAuthenticate, void>> storeToken(String token) async {
    try {
      return Right(await datasource.storeTokenOnStorage(token));
    } on StorageTokenError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(StorageTokenError());
    }
  }

  @override
  Future<Either<FailureAuthenticate, String>> getToken() async {
    try {
      return Right(await datasource.getTokenOfStorage());
    } on GetTokenError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(StorageTokenError());
    }
  }

}