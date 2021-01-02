import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<FailureAuthenticate, UserAuthenticaded>> login(String email, String password);
}