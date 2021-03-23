import 'package:app_vidracaria/modules/project/domain/entities/Project.dart';
import 'package:app_vidracaria/modules/project/domain/entities/ProjectType.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/deleteProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/inputs/filterProjectInput.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/deleteProject.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/listProject.dart';
import 'package:app_vidracaria/modules/project/domain/usecases/listProjectType.dart';
import 'package:app_vidracaria/modules/project/presenter/projects/states/state.dart';
import 'package:mobx/mobx.dart';

part 'projects_controller.g.dart';

class ProjectsController = _ProjectsControllerBase with _$ProjectsController;

abstract class _ProjectsControllerBase with Store {
  final ListProject listProject;
  final ListProjectType listProjectType;
  final DeleteProject deleteProject;

  _ProjectsControllerBase(
      {this.listProject, this.listProjectType, this.deleteProject}) {
    doBuilderContent(FilterProjectInput(
      numberGlass: 0,
      projectType: 0,
      title: '',
    ));
  }

  @observable
  ProjectState state = ProjectLoading();
  @observable
  ProjectTypeState projectTypeState = ProjectTypeStart();

  @observable
  List<Project> listProjects = List<Project>();

  @observable
  List<ProjectType> listTypes = List<ProjectType>();

  @action
  doBuilderContent(FilterProjectInput input) async {
    final result = await doListProjectType();
    final x = await doListProjects(input);

    setState(ProjectStart(x, types: result));
  }

  @action
  Future<List<ProjectType>> doListProjectType() async {
    setTypeState(ProjectTypeLoading());
    final result = await listProjectType();

    return result.fold((l) => <ProjectType>[], (r) => r);
  }

  @action
  Future<List<Project>> doListProjects(FilterProjectInput input) async {
    //setState(ProjectLoading());

    final result = await listProject(input);

    return result.fold((l) => setState(ProjectError(l)), (r) => r);
  }

  @action
  doDeleteProject(DeleteProjectInput input) async {
    setState(ProjectLoading());

    final result = await deleteProject(input);

    final inputList = FilterProjectInput(
      numberGlass: 0,
      projectType: 0,
      title: '',
    );

    return result.fold(
        (l) => setState(ProjectError(l)),
        (r) async {
          final result = await doListProjectType();
          final x = await doListProjects(inputList);
          return setState(ProjectSuccess(x, types: result));
        });
  }

  @action
  setState(ProjectState value) => state = value;

  @action
  setTypeState(ProjectTypeState value) => projectTypeState = value;
}
