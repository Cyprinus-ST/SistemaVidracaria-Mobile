import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/get_user_authenticaded.dart';
import 'package:app_vidracaria/modules/costumer/domain/usecases/listCostumers.dart';
import 'package:app_vidracaria/modules/costumer/presenter/costumers/states/state.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/listProject.dart';
import 'package:mobx/mobx.dart';

part 'costumers_controller.g.dart';

class CostumersController = _CostumersControllerBase
    with _$CostumersController;

abstract class _CostumersControllerBase with Store {
  final GetUserAuthenticaded getUserAuthenticaded;
  final ListCostumers listCostumers;

  _CostumersControllerBase({this.listCostumers, this.getUserAuthenticaded}) {
    doListCostumers();
  }

  @observable
  CostumersState state = CostumersStart();

  @action
  Future doListCostumers() async {
    setState(CostumersLoading());
    User loggedUser;
    final resultUser = await getUserAuthenticaded();
    resultUser.fold((l) => setState(CostumersError()), (r) => {loggedUser = r});

    final resultCostumers = await listCostumers(loggedUser.id);
    resultCostumers.fold((l) => setState(CostumersError(error: l)), (r) => setState(CostumersSuccess(r)));
  }

  @action
  setState(CostumersState value) => state = value;
}
