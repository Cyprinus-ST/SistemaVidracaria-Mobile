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
import 'package:app_vidracaria/modules/budget/domain/usecases/listUserBudgets.dart';
import 'package:app_vidracaria/modules/budget/external/datasources/budget_datasource.dart';
import 'package:app_vidracaria/modules/budget/infra/repositories/budget_repository_impl.dart';
import 'package:app_vidracaria/modules/budget/presenter/addBudget/addBudget_page.dart';
import 'package:app_vidracaria/modules/costumer/domain/usecases/addCostumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/usecases/deleteCostumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/usecases/editCostumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/usecases/listCostumers.dart';
import 'package:app_vidracaria/modules/costumer/external/datasources/costumers_datasource_impl.dart';
import 'package:app_vidracaria/modules/costumer/infra/repositories/costumers_repository_impl.dart';
import 'package:app_vidracaria/modules/costumer/presenter/addCostumer/addCostumer_controller.dart';
import 'package:app_vidracaria/modules/costumer/presenter/addCostumer/addCostumer_page.dart';
import 'package:app_vidracaria/modules/costumer/presenter/costumers/costumers_controller.dart';
import 'package:app_vidracaria/modules/costumer/presenter/costumers/costumers_page.dart';
import 'package:app_vidracaria/modules/costumer/presenter/view_costumer/view_costumer_page.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/dashboard_controller.dart';
import 'package:app_vidracaria/modules/budget/presenter/budget/budget_page.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/dashboard_page.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/addProject.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/deleteProject.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/editProject.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/listProject.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/listProjectType.dart';
import 'package:app_vidracaria/modules/project/external/datasources/project_datasource_impl.dart';
import 'package:app_vidracaria/modules/project/infra/repositories/project_repository_impl.dart';
import 'package:app_vidracaria/modules/project/presenter/addProject/addProject_controller.dart';
import 'package:app_vidracaria/modules/project/presenter/addProject/addProject_page.dart';
import 'package:app_vidracaria/modules/project/presenter/projects/projects_controller.dart';
import 'package:app_vidracaria/modules/project/presenter/projects/projects_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

import 'modules/auth/domain/usecases/authenticate_user.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        
        /// LOGIN USECASES ///
        Bind((i) => AuthenticateUserImpl(i())),
        Bind((i) => StoreUserAuthenticadedImpl(i())),
        Bind((i) => ForgotPasswordImpl(i())), 
        Bind((i) => RegisterUserImpl(i())),
        Bind((i) => UserTokenIsValidImpl(i())),
        Bind((i) => GetUserAuthenticadedImpl(i())),

        /// BUDGET USECASES ///
        Bind((i) => ListUserBudgetsImpl(i())),

        /// COSTUMERS USECASES ///
        Bind((i) => AddCostumerImpl(i())),
        Bind((i) => ListCostumersImpl(i())),
        Bind((i) => EditCostumerImpl(i())),
        Bind((i) => DeleteCostumerImpl(i())),

        /// PROJECT USECASES
        Bind((i) => AddProjectImpl(i())),
        Bind((i) => ListProjectImpl(i())),
        Bind((i) => ListProjectTypeImpl(i())),
        Bind((i) => EditProjectImpl(i())),
        Bind((i) => DeleteProjectImpl(i())),

        /// REPOSITORIES ///
        Bind((i) => AuthRepositoryImpl(i())),
        Bind((i) => SecureStorageRepositoryImpl(i())),
        Bind((i) => BudgetRepositoryImpl(i())),
        Bind((i) => CostumersRepositoryImpl(i())),
        Bind((i) => ProjectRepositoryImpl(i())),

        /// DATASOURCES ///
        Bind((i) => AuthDatasourceImpl(i())),
        Bind((i) => SecureStorageDatasourceImpl(client: i())),
        Bind((i) => BudgetDatasourceImpl(i(), i())),
        Bind((i) => CostumersDatasourceImpl(i(), i())),
        Bind((i) => ProjectDatasourceImpl(i(), i())),

        /// LIB ///
        Bind((i) => Client()),
        Bind((i) => FlutterSecureStorage()),

        /// CONTROLLER ///
        Bind((i) => LoginController(authenticateUserUsecase: i(), storageUserAuthenticadedUsecase: i(), userTokenIsValidUsecase: i())),
        Bind((i) => ForgotPasswordController(forgotPasswordUsecase: i())),
        Bind((i) => RegisterController(registerUserUsecase: i())),
        Bind((i) => DashboardController(getUserAuthenticaded: i())),
        Bind((i) => AddCostumerController(addCostumer: i(), getUserAuthenticaded: i(), editCostumer: i())),
        Bind((i) => CostumersController(listCostumers: i(), getUserAuthenticaded: i(), deleteCostumer: i())),
        Bind((i) => ProjectsController(listProject: i(), listProjectType: i(), deleteProject: i())),
        Bind((i) => AddProjectController(addProject: i(), listProjectType: i(), editProject: i())),
      ];

  @override
  List<ModularRouter> get routers => [
        //LOGIN
        ModularRouter('/', child: (_, __) => LoginPage()),
        ModularRouter('/forgot-password', child: (_, __) => ForgotPasswordPage()),
        ModularRouter('/register-user', child: (_, __) => RegisterPage()),

        //DASHBOARD
        ModularRouter('/dashboard', child: (_,__) => DashboardPage()),

        //COSTUMERS
        ModularRouter('/dashboard/costumers', child: (_, __) => CostumersPage()),
        ModularRouter('/dashboard/costumers/add', child: (_, __) => AddCostumerPage(costumer: Modular.args.data,)),
        ModularRouter('/dashboard/costumers/view', child: (_, __) => ViewCostumerPage(costumer: Modular.args.data,)),

        //BUDGET
        ModularRouter('/dashboard/budget', child: (_, __) => BudgetPage()),
        ModularRouter('/dashboard/budget/add', child: (_, __) => AddBudgetPage()),

        //PROJECT
        ModularRouter('/dashboard/projects', child: (_, __) => ProjectPage()),
        ModularRouter('/dashboard/projects/add', child: (_, __) => AddProjectPage(project: Modular.args.data,)),
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}
