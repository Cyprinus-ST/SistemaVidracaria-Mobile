import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:app_vidracaria/modules/auth/infra/models/user_authenticaded_model.dart';
import 'package:app_vidracaria/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AuthDataSourceMock extends Mock implements AuthDataSource {}

void main() {
  final datasource = AuthDataSourceMock();
  final repository = AuthRepositoryImpl(datasource);
  test('deve retornar um UserAuthenticaded', () async {
    when(datasource.doAuthenticateUser(any, any))
        .thenAnswer((_) async => UserAuthenticadedModel());
    final result = await repository.login('caio@gmail.com', '1234');
    expect(result | null, isA<UserAuthenticaded>());
  });

  test('deve retornar um error caso o datasource falhar', () async {
    when(datasource.doAuthenticateUser(any, any)).thenThrow(Exception());
    final result = await repository.login('caio@gmail.com', '1234');
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
