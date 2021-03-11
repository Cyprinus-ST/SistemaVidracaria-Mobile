import 'dart:convert';

import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/util/parsed_response.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:app_vidracaria/modules/config/environment.dart';
import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/addProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/deleteProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/editProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/getProjectnput.dart';
import 'package:app_vidracaria/modules/project/infra/datasources/project_datasource.dart';
import 'package:http/http.dart';

class ProjectDatasourceImpl implements ProjectDatasource {
  final Client client;
  final SecureStorageDatasource secureStorageDatasource;

  ProjectDatasourceImpl(this.client, this.secureStorageDatasource);

  @override
  Future<void> addProject(AddProjectInput input) async {
    final token = await _getToken();

    final body = jsonEncode({
      "title": input.title,
      "numberGlass": input.numberGlass,
      "description": input.description,
      "idUser": input.idUser,
      "imageUrl": input.imageUrl,
      "projectType": input.projectType
    });

    final response = await client.post(Environment.URL + "Project",
        body: body, headers: Environment.headers(token));

    ParserResponse.doParserResponse(response);
  }

  @override
  Future<List<Project>> listProject(FilterProjectInput input) async {
    final token = await _getToken();
    final loggedUser = await _geUserAuthenticaded();

    input.idUser = loggedUser.id;

    final body = jsonEncode({
      "idUser": input.idUser,
    });

    final response = await client.post(
        Environment.URL + "Project/" + "ListFiltered",
        headers: Environment.headers(token),
        body: body);

    final data = ParserResponse.doParserResponse(response)['data'] as List;
    List<Project> result = data.map((e) => Project.fromJson(e)).toList();

    return result;
  }

  @override
  Future<void> deleteProject(DeleteProjectInput input) async {
    final token = await _getToken();

    final response = await client.delete(
      Environment.URL + "Project"+"?ID="+input.id,
      headers: Environment.headers(token),
    );

    ParserResponse.doParserResponse(response);
  }

  @override
  Future<Project> getProject(GetProjectInput input) async {
    final token = await _getToken();

    final response = await client.get(
      Environment.URL + "Project/"+input.id,
      headers: Environment.headers(token),
    );

    final data = ParserResponse.doParserResponse(response);
    return Project.fromJson(data);
  }

  @override
  Future<void> editProject(EditProjectInput input) async {
    final token = await _getToken();

    final body = jsonEncode({
      "id": input.id,
      "title": input.title,
      "numberGlass": input.numberGlass,
      "descripition": input.description,
      "idUser": input.idUser,
      "imageUrl": input.imageUrl,
      "projectType": input.projectType
    });

    final response = await client.put(
      Environment.URL + "Project/"+input.id,
      headers: Environment.headers(token),
      body: body
    );

    ParserResponse.doParserResponse(response);
  }

  Future<String> _getToken() async {
    return await secureStorageDatasource.getTokenOfStorage();
  }

  Future<User> _geUserAuthenticaded() async {
    return await secureStorageDatasource.getUserAuthenticaded();
  }
}
