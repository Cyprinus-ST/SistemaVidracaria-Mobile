import 'dart:convert';

import 'package:app_vidracaria/modules/auth/external/datasources/auth_validator_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class HttpMock extends Mock implements Client {}

void main() {
  final client = new HttpMock();
  final datasource = AuthDatasourceImpl(client);

  test('deve retornar usuário autenticado', () async {
    final token = '''{ "token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6WyJsdWNhcy52aWxhc0BlbWFpbC5jb20iLCJsdWNhcy52aWxhc0BlbWFpbC5jb20iXSwianRpIjoiY2M0ZjNmNmQtMjQ5NC00ZTQ5LTlhNjItYmY4MWY1Y2Q3MjU4IiwibmJmIjoxNjA5MzY2MDk1LCJleHAiOjE2MDkzNjYyMTUsImlhdCI6MTYwOTM2NjA5NSwiaXNzIjoiRXhlbXBsb0lzc3VlciIsImF1ZCI6IkV4ZW1wbG9BdWRpZW5jZSJ9.b6kISnwiWYj9Jx7FrL6Glp0MURABWCsdjmiYgAzccozMfzzlCwUTGUQLos2Bm5mKVtDnWV4FP7tuI8_Cjl0ANgN203v_Uo4a9iW95cs7bxUAm5nyNgMQRvXHkgd4nhmGKGRdS0WvuVyNjnX9kvWJyT-vhySZPzCEvt6K-2-U1kQbyMUtTrhMeJ1XRSmNwOAbY291rD9LZyxbvvla1IdozgZvkJUXn3ILA5_H6oV9_UZevRA1dEPApjc18BKUQTmEhl9AY8TlSsizJO8WgzAU8lUM8eb8mS_SNzhw18fFCZpQ6VN-yd38iMWli1Y7A1p8njZ54tbpMWwDWu7zHAEoaA" } ''';
    when(client.get(any))
        .thenAnswer((_) async => Response(jsonDecode(token), 200));

    final result = datasource.doAuthenticateUser('caio@gmail.com', '1234');
    expect(result, completes);
  });
}

const requestResult = """
{
  "token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6WyJsdWNhcy52aWxhc0BlbWFpbC5jb20iLCJsdWNhcy52aWxhc0BlbWFpbC5jb20iXSwianRpIjoiY2M0ZjNmNmQtMjQ5NC00ZTQ5LTlhNjItYmY4MWY1Y2Q3MjU4IiwibmJmIjoxNjA5MzY2MDk1LCJleHAiOjE2MDkzNjYyMTUsImlhdCI6MTYwOTM2NjA5NSwiaXNzIjoiRXhlbXBsb0lzc3VlciIsImF1ZCI6IkV4ZW1wbG9BdWRpZW5jZSJ9.b6kISnwiWYj9Jx7FrL6Glp0MURABWCsdjmiYgAzccozMfzzlCwUTGUQLos2Bm5mKVtDnWV4FP7tuI8_Cjl0ANgN203v_Uo4a9iW95cs7bxUAm5nyNgMQRvXHkgd4nhmGKGRdS0WvuVyNjnX9kvWJyT-vhySZPzCEvt6K-2-U1kQbyMUtTrhMeJ1XRSmNwOAbY291rD9LZyxbvvla1IdozgZvkJUXn3ILA5_H6oV9_UZevRA1dEPApjc18BKUQTmEhl9AY8TlSsizJO8WgzAU8lUM8eb8mS_SNzhw18fFCZpQ6VN-yd38iMWli1Y7A1p8njZ54tbpMWwDWu7zHAEoaA",
} 
""";
