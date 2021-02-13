
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/register_input.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/auth_repository.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource datasource;

  AuthRepositoryImpl(this.datasource);
  
  @override
  Future<Either<FailureAuthenticate, UserAuthenticaded>> login(
      String email, String password) async {
    try {
      final result = await datasource.doAuthenticateUser(email, password);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }

  @override
  Future<Either<FailureAuthenticate, void>> forgotPassword(String email) async {
    try {
      await datasource.doForgotPassword(email);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }

  @override
  Future<Either<FailureAuthenticate, void>> registerUser(RegisterInput input) async {
    try {
      await datasource.doRegisterUser(input);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
