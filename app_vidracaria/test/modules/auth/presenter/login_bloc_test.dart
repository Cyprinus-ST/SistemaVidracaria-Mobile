
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:app_vidracaria/modules/auth/presenter/login_bloc.dart';
import 'package:app_vidracaria/modules/auth/presenter/states/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AuthenticateUserMock extends Mock implements AuthenticateUser {}

main() {
  final usecase = AuthenticateUserMock();
  final bloc = LoginBloc(usecase);

  test('deve retornar os estados na ordem correta', () {
    final input = new LoginInput(email: 'caio@gmail.com', password: '123456');

    when(usecase.call(any)).thenAnswer((_) async => Right(UserAuthenticaded()));

    expect(bloc, emitsInOrder([
      isA<LoginLoading>(),
      isA<LoginSuccess>(),
    ]));
    bloc.add(input);
  });

  test('deve retornar um error de estado', () {
    final input = new LoginInput(email: 'caio@gmail.com', password: '123456');

    when(usecase.call(any)).thenAnswer((_) async => Left(InvalidFieldsError()));

    expect(bloc, emitsInOrder([
      isA<LoginLoading>(),
      isA<LoginError>(),
    ]));
    bloc.add(input);
  });
}