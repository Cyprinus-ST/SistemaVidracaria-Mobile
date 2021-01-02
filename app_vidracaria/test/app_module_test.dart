
import 'dart:convert';

import 'package:app_vidracaria/app_module.dart';
import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class HttpMock extends Mock implements Client {}

//teste de integração
main() {
  final client = new HttpMock();

  initModule(AppModule(), changeBinds: [
    Bind<Client>((i) => client)
  ]);
  test('Deve recuperar os usecase sem erro', () {
    final usecase = Modular.get<AuthenticateUser>();
    expect(usecase, isA<AuthenticateUserImpl>());
  });

  test('Deve realizar o login com o usuário e senha', () async {
    final input = new LoginInput(email: 'caio@gmail.com', password: '1234');

    when(client.get(any)).thenAnswer((_) async => Response(jsonDecode('{}'), 200));

    final usecase = Modular.get<AuthenticateUser>();
    final result = await usecase(input);
    
    expect(result | null, isA<UserAuthenticaded>());
  });
}