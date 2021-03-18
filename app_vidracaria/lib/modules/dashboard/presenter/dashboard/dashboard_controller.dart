import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/get_user_authenticaded.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/states/state.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final GetUserAuthenticaded getUserAuthenticaded;

  _DashboardControllerBase({this.getUserAuthenticaded}) {
    doGetUserAuthenticaded();
  }

  @observable
  DashboardState state = DashboardLoading();

  @observable
  User user;

  @action
  Future doGetUserAuthenticaded() async {
//    setState(DashboardLoading());
    final result = await getUserAuthenticaded();

    result.fold(
      (l) => setState(FailureGetUserAuthenticaded("Falha ao obter os dados do usuário")),
      (r) {
        this.user = r;
        setState(DashboardStart(r));
      },
    );
  }

  @action
  setState(DashboardState value) => state = value;
}
