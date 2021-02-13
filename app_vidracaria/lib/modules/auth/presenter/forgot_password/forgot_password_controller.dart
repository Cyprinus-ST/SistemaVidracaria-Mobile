
import 'package:app_vidracaria/modules/auth/domain/inputs/forgot_password_input.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/forgot_password.dart';
import 'package:app_vidracaria/modules/auth/presenter/forgot_password/states/state.dart';
import 'package:mobx/mobx.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = _ForgotPasswordControllerBase with _$ForgotPasswordController;

abstract class _ForgotPasswordControllerBase with Store {
  final ForgotPassword forgotPasswordUsecase;

  _ForgotPasswordControllerBase({ this.forgotPasswordUsecase });

  @observable
  ForgotPasswordState state = ForgotPasswordStart();

  @action
  doForgotPassword(ForgotPasswordInput input) async {
    setState(ForgotPasswordLoading());
    final result = await forgotPasswordUsecase(input);
    result.fold((l) => setState(ForgotPasswordError(l)), (r) => setState(ForgotPasswordSuccess()));    
  }

  @action 
  setState(ForgotPasswordState value) => state = value;
}