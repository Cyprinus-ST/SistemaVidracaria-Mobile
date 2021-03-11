import 'package:app_vidracaria/modules/auth/domain/entities/user.dart';
import 'package:app_vidracaria/modules/auth/domain/usecases/get_user_authenticaded.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/usecases/addCostumer.dart';
import 'package:app_vidracaria/modules/costumer/presenter/addCostumer/states/state.dart';
import 'package:app_vidracaria/modules/dashboard/presenter/dashboard/states/state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'addCostumer_controller.g.dart';

class AddCostumerController = _AddCostumerControllerBase
    with _$AddCostumerController;

abstract class _AddCostumerControllerBase with Store {
  final AddCostumer addCostumer;
  final GetUserAuthenticaded getUserAuthenticaded;

  _AddCostumerControllerBase({this.addCostumer, this.getUserAuthenticaded});

  @observable
  AddCostumerState state = AddCostumerStart();

  @action
  Future doCreateClient(AddCostumerInput input) async {
    final user = await getUserAuthenticaded();
    user.fold((l) => AddCostumerError(), (r) => {input.idUser = r.id});

    final result = await addCostumer(input);

    result.fold((l) => setState(AddCostumerError(error: l)),
        (r) => Modular.to.popAndPushNamed('/dashboard/costumers'));
  }

  @action
  setState(AddCostumerState value) => state = value;
}
