import 'dart:convert';

import 'package:app_vidracaria/modules/auth/domain/util/parsed_response.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:app_vidracaria/modules/config/environment.dart';
import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/deleteCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/editCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/infra/datasources/costumers_datasource.dart';
import 'package:http/http.dart';

class CostumersDatasourceImpl implements CostumersDatasource {
  final Client client;
  final SecureStorageDatasource secureStorageDatasource;

  CostumersDatasourceImpl(this.client, this.secureStorageDatasource);

  @override
  Future<void> addClient(AddCostumerInput input) async {
    final String token = await _getToken();

    final body = jsonEncode({
      "IdUser": input.idUser,
      "Name": input.name,
      "Email": input.email,
      "Phone": input.phone,
    });

    final response =
        await client.post(Environment.URL + "Costumer", body: body, headers: {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    });

    ParserResponse.doParserResponse(response);
  }

  @override
  Future<List<Costumer>> listClients(String idUser) async {
    final String token = await _getToken();

    final response = await client
        .get(Environment.URL + "Costumer?idUser=" + idUser, headers: {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    });

    final data = ParserResponse.doParserResponse(response)['listCostumers'] as List;
    List<Costumer> result = data.map((e) => Costumer.fromJson(e)).toList();
    
    return result;
  }

  Future<String> _getToken() async {
    return await secureStorageDatasource.getTokenOfStorage();
  }

  @override
  Future<void> editCostumer(EditCostumerInput input) async {
    final String token = await _getToken();

    final body = jsonEncode({
      "id": input.id,
      "idUser": input.idUser,
      "name": input.name,
      "email": input.email,
      "phone": input.phone,
    });

    final response =
        await client.put(Environment.URL + "Costumer", body: body, headers: Environment.headers(token));

    ParserResponse.doParserResponse(response);
  }

  Future<void> deleteCostumer(DeleteCostumerInput input) async {
    final String token = await _getToken();

    final response =
        await client.delete(Environment.URL + "Costumer?id="+input.id, headers: Environment.headers(token));
    ParserResponse.doParserResponse(response);
  }
}
