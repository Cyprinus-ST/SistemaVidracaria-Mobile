import 'package:app_vidracaria/app_widget.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/forgot_password.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/get_user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/register_user.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/storage_user_token.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/user_token_is_valid.dart';
import 'package:app_vidracaria/modules/auth/external/datasources/auth_validator_datasource.dart';
import 'package:app_vidracaria/modules/auth/external/datasources/secure_storage_datasource_impl.dart';
import 'package:app_vidracaria/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:app_vidracaria/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:app_vidracaria/modules/auth/infra/repositories/secure_storage_repository_impl.dart';
import 'package:app_vidracaria/modules/auth/presenter/forgot_password/forgot_password_controller.dart';
import 'package:app_vidracaria/modules/auth/presenter/forgot_password/forgot_password_page.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/login_controller.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/login_page.dart';
import 'package:app_vidracaria/modules/auth/presenter/register/register_controller.dart';
import 'package:app_vidracaria/modules/auth/presenter/register/register_page.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/dashboard_controller.dart';
import 'package:app_vidracaria/modules/budget/presenter/budget/budget_page.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/dashboard_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

import 'modules/auth/domain/usecases/authenticate_user.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        
        /// USECASES ///
        Bind((i) => AuthenticateUserImpl(i())),
        Bind((i) => StoreUserAuthenticadedImpl(i())),
        Bind((i) => ForgotPasswordImpl(i())), 
        Bind((i) => RegisterUserImpl(i())),
        Bind((i) => UserTokenIsValidImpl(i())),
        Bind((i) => GetUserAuthenticadedImpl(i())),

        /// REPOSITORIES ///
        Bind((i) => AuthRepositoryImpl(i())),
        Bind((i) => SecureStorageRepositoryImpl(i())),

        /// DATASOURCES ///
        Bind((i) => AuthDatasourceImpl(i())),
        Bind((i) => SecureStorageDatasourceImpl()),

        /// LIB ///
        Bind((i) => Client()),
        Bind((i) => FlutterSecureStorage()),

        /// CONTROLLER ///
        Bind((i) => LoginController(authenticateUserUsecase: i(), storageUserAuthenticadedUsecase: i(), userTokenIsValidUsecase: i())),
        Bind((i) => ForgotPasswordController(forgotPasswordUsecase: i())),
        Bind((i) => RegisterController(registerUserUsecase: i())),
        Bind((i) => DashboardController(getUserAuthenticaded: i())),
      ];

  @override
  List<ModularRouter> get routers => [
        //ModularRouter('/', child: (_, __) => DashboardPage()),
        ModularRouter('/', child: (_, __) => LoginPage()),
        ModularRouter('/forgot-password', child: (_, __) => ForgotPasswordPage()),
        ModularRouter('/register-user', child: (_, __) => RegisterPage()),
        ModularRouter('/dashboard', child: (_,__) => DashboardPage()),
        ModularRouter('/dashboard/budget', child: (_, __) => BudgetPage()),
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}
