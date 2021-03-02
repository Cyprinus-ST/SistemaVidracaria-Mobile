
import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/storage_user_token.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SecureStorageRepositoryMock extends Mock implements SecureStorageRepository {}

void main() {
  final repository = SecureStorageRepositoryMock();
  final usecase = StoreUserAuthenticadedImpl(repository);

  test('Deve armazenar o token do usuário', () async {
    when(repository.storeUserAuthenticaded(any)).thenAnswer((_) async => null);

    final result = await usecase("dsfdsfsdfxzczx");
    expect(result, isA<Null>());
  });  

  test('Deve retornar um erro InvalidTokenError caso o token seja inválido', () async {
    when(repository.storeUserAuthenticaded(any)).thenAnswer((_) => null);

    final result = await usecase(null);
    expect(result.fold((l) => FailureAuthenticate, (r) => null), isA<InvalidTokenError>());
  });
}