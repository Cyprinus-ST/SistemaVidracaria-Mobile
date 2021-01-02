import 'package:app_vidracaria/modules/auth/domain/inputs/login_input.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:app_vidracaria/modules/auth/presenter/states/state.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginInput, LoginState> {
  final AuthenticateUser usecase;
  
  LoginBloc(this.usecase) : super(LoginStart());
  
  @override
  Stream<LoginState> mapEventToState(LoginInput input) async* {
    yield LoginLoading();
    final result = await usecase(input);
    yield result.fold((l) => LoginError(l), (r) => LoginSuccess(r));
  }
  

}