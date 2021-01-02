
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/auth_repository.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = AuthenticateUserImpl(repository);

  test('deve retornar um UserAuthenticaded com o token do usuário', () async {
    final input = new LoginInput(email: 'caio@gmail.com', password: '123456');

    when(repository.login(any, any)).thenAnswer((_) async => Right(UserAuthenticaded()));

    final result = await usecase(input);
    expect(result.getOrElse(() => null), isA<UserAuthenticaded>());
  });

  test('deve retornar um InvalidFieldsError caso o email senha inválido', () async {
    final input = new LoginInput(email: null, password: '123456');

    when(repository.login(any, any)).thenAnswer((_) async => Right(UserAuthenticaded()));

    final result = await usecase(input);
    expect(result.fold(id, id), isA<InvalidFieldsError>());
  });

  test('deve retornar um InvalidFieldsError caso o passoword senha inválido', () async {
    final input = new LoginInput(email: 'caio@gmail.com', password: null);

    when(repository.login(any, any)).thenAnswer((_) async => Right(UserAuthenticaded()));

    final result = await usecase(input);
    expect(result.fold(id, id), isA<InvalidFieldsError>());
  });
}