import 'dart:convert';

import 'package:app_vidracaria/modules/auth/domain/errors/errors.dart';
import 'package:http/http.dart';

abstract class ParserResponse {
  static doParserResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        Map data = jsonDecode(response.body);
        return data;
      case 401:
        print("deu 401 ruim");
        throw DataSourceError();
      case 500:
        print("deu 500 ruim");
        throw DataSourceError();
      default:
        throw DataSourceError();
    }
  }
}