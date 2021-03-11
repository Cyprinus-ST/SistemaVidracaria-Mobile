import 'dart:async';

import 'package:app_vidracaria/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/get_user_token.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/storage_user_token.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/user_token_is_valid.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/states/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthenticateUser authenticateUserUsecase;
  final StoreUserAuthenticaded storageUserAuthenticadedUsecase;
  final UserTokenIsValid userTokenIsValidUsecase;
  final GetUserToken getUserToken;

  @observable
  bool isAuthenticated;

  @observable
  LoginState state = new LoginStart();

  @observable
  UserAuthenticaded userAuthenticaded = new UserAuthenticaded();

  @observable
  String acessToken;

  _LoginControllerBase(
      {this.authenticateUserUsecase,
      this.storageUserAuthenticadedUsecase,
      this.userTokenIsValidUsecase,
      this.getUserToken}) {
        verifyIfUserAuthenticated();
      }

  @action
  Future doAuthenticateUser(LoginInput input) async {
    setState(LoginLoading());
    final result = await authenticateUserUsecase(input);

    result.fold(
        (l) => setState(LoginError(l)), (r) {
          doStoreUserAuthenticaded(r);
          this.userAuthenticaded = r;
        });
  }

  doStoreUserAuthenticaded(UserAuthenticaded user) async {
    final result = await storageUserAuthenticadedUsecase(user);

    result.fold(
        (l) => setState(LoginError(l)), 
        (r) {
          setState(LoginSuccess());
          Modular.to.pushNamed('/dashboard');
        } );
  }

  @action
  Future getAccessToken() async {
    final result = await getUserToken();

    return result.fold((l) => setState(LoginError(l)), (r) => this.acessToken = r);
  }

  @action
  Future verifyIfUserAuthenticated() async {
    final result = await userTokenIsValidUsecase();

    result.fold((l) => setState(LoginError(l)), (r) {
      if(r) {
        setState(NotAuthenticaded());
      } else {
        setState(Authenticaded());
        Modular.to.pushNamed('/dashboard');
      }
    });
  }

  @action
  setState(LoginState value) => state = value;
}
