import 'package:app_vidracaria/modules/project/domain/inputs/addProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/editProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/addProject.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/editProject.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/listProjectType.dart';
import 'package:app_vidracaria/modules/project/presenter/addProject/states/state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'addProject_controller.g.dart';

class AddProjectController = _AddProjectControllerBase with _$AddProjectController;

abstract class _AddProjectControllerBase with Store {
  final ListProjectType listProjectType;
  final AddProject addProject;
  final EditProject editProject;

  _AddProjectControllerBase({this.listProjectType, this.addProject, this.editProject}) {
    doListProjectType();
  }

  @observable
  AddProjectState state = AddProjectLoading();

  @action
  doListProjectType() async {
    setState(AddProjectLoading());
    final result = await listProjectType();

    result.fold((l) => setState(AddProjectError(l)), (r) => setState(AddProjectSuccess(r)));
  }

   @action
  Future doAddProject(AddProjectInput input) async {
    setState(AddProjectLoading());
    final result = await addProject(input);

    result.fold((l) => AddProjectError(l), (r) => {
      Modular.to.popAndPushNamed('/dashboard/projects')
    });
  }

  doEditProject(EditProjectInput input) async {
    setState(AddProjectLoading());
    final result = await editProject(input);

    result.fold((l) => setState(AddProjectError(l)), (r) => {
      Modular.to.popAndPushNamed('/dashboard/projects')
    });
  }

  @action
  setState(AddProjectState value) => state = value;
}
