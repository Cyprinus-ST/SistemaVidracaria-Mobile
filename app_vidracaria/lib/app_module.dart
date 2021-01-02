import 'package:app_vidracaria/app_widget.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/storage_user_token.dart';
import 'package:app_vidracaria/modules/auth/external/datasources/auth_validator_datasource.dart';
import 'package:app_vidracaria/modules/auth/external/datasources/secure_storage_datasource_impl.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:app_vidracaria/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:app_vidracaria/modules/auth/infra/repositories/secure_storage_repository_impl.dart';
import 'package:app_vidracaria/modules/auth/presenter/login_bloc.dart';
import 'package:app_vidracaria/modules/auth/presenter/login_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

import 'modules/auth/domain/usecases/authenticate_user.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthenticateUserImpl(i())),
        Bind((i) => StorageUserTokenImpl(i())),
        Bind((i) => Client()),
        Bind((i) => FlutterSecureStorage()),
        Bind((i) => AuthDatasourceImpl(i())),
        Bind((i) => AuthRepositoryImpl(i())),
        Bind((i) => SecureStorageRepositoryImpl(i())),
        Bind((i) => AuthDatasourceImpl(i())),
        Bind((i) => SecureStorageDatasourceImpl()),
        Bind((i) => LoginBloc(i())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, __) => LoginPage()),
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}
