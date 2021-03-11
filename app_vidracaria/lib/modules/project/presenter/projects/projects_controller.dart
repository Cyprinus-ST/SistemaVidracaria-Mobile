import 'package:app_vidracaria/modules/costumer/presenter/costumers/states/state.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/listProject.dart';
import 'package:app_vidracaria/modules/project/presenter/projects/states/state.dart';
import 'package:mobx/mobx.dart';

part 'projects_controller.g.dart';

class ProjectsController = _ProjectsControllerBase with _$ProjectsController;

abstract class _ProjectsControllerBase with Store {
  final ListProject listProject;

  _ProjectsControllerBase({this.listProject});

  @observable
  ProjectState state = ProjectStart();

  @action
  doListProjects(FilterProjectInput input) async {
    setState(ProjectLoading());

    final result = await listProject(input);

    result.fold(
        (l) => setState(ProjectError(l)), (r) => setState(ProjectSuccess(r)));
  }

  @action
  setState(ProjectState value) => state = value;
}
