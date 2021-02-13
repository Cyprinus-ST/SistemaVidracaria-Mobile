

import 'package:app_vidracaria/modules/auth/domain/inputs/register_input.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/register_user.dart';
import 'package:app_vidracaria/modules/auth/presenter/register/states/state.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterUser registerUserUsecase;

  _RegisterControllerBase({ this.registerUserUsecase });

  @observable
  RegisterState state = RegisterStart();

  doRegisterUser(RegisterInput input) async {
    setState(RegisterLoading());
    final result = await registerUserUsecase(input);
    result.fold((l) => setState(RegisterError(l)), (r) => setState(RegisterSuccess()));
  }

  @action
  setState(RegisterState value) => state = value;
}