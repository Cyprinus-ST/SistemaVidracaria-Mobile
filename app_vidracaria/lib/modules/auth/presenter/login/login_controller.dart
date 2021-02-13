import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/storage_user_token.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/states/login_state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store{
  final AuthenticateUser authenticateUserUsecase;
  final StoreUserToken storageUserTokenUsecase;

  @observable
  LoginState state = new LoginStart();
  
  @observable
  UserAuthenticaded userAuthenticaded = new UserAuthenticaded();

  _LoginControllerBase({this.authenticateUserUsecase, this.storageUserTokenUsecase});

  @action
  Future doAuthenticateUser(LoginInput input) async {
    setState(LoginLoading());
    final result = await authenticateUserUsecase(input);
  
    result.fold(
      (l) => setState(LoginError(l)),
      (r) => doStoreUserToken(r.acessToken));
      
  }

  doStoreUserToken(String token) async {
    final result = await storageUserTokenUsecase(token);

    result.fold((l) => setState(LoginError(l)), (r) => setState(LoginSuccess()));
  }

  @action 
  setState(LoginState value) => state = value;
}
