// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsController on _ProjectsControllerBase, Store {
  final _$stateAtom = Atom(name: '_ProjectsControllerBase.state');

  @override
  ProjectState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ProjectState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$projectTypeStateAtom =
      Atom(name: '_ProjectsControllerBase.projectTypeState');

  @override
  ProjectTypeState get projectTypeState {
    _$projectTypeStateAtom.reportRead();
    return super.projectTypeState;
  }

  @override
  set projectTypeState(ProjectTypeState value) {
    _$projectTypeStateAtom.reportWrite(value, super.projectTypeState, () {
      super.projectTypeState = value;
    });
  }

  final _$listProjectsAtom = Atom(name: '_ProjectsControllerBase.listProjects');

  @override
  List<Project> get listProjects {
    _$listProjectsAtom.reportRead();
    return super.listProjects;
  }

  @override
  set listProjects(List<Project> value) {
    _$listProjectsAtom.reportWrite(value, super.listProjects, () {
      super.listProjects = value;
    });
  }

  final _$listTypesAtom = Atom(name: '_ProjectsControllerBase.listTypes');

  @override
  List<ProjectType> get listTypes {
    _$listTypesAtom.reportRead();
    return super.listTypes;
  }

  @override
  set listTypes(List<ProjectType> value) {
    _$listTypesAtom.reportWrite(value, super.listTypes, () {
      super.listTypes = value;
    });
  }

  final _$doBuilderContentAsyncAction =
      AsyncAction('_ProjectsControllerBase.doBuilderContent');

  @override
  Future doBuilderContent(FilterProjectInput input) {
    return _$doBuilderContentAsyncAction
        .run(() => super.doBuilderContent(input));
  }

  final _$doListProjectTypeAsyncAction =
      AsyncAction('_ProjectsControllerBase.doListProjectType');

  @override
  Future<List<ProjectType>> doListProjectType() {
    return _$doListProjectTypeAsyncAction.run(() => super.doListProjectType());
  }

  final _$doListProjectsAsyncAction =
      AsyncAction('_ProjectsControllerBase.doListProjects');

  @override
  Future<List<Project>> doListProjects(FilterProjectInput input) {
    return _$doListProjectsAsyncAction.run(() => super.doListProjects(input));
  }

  final _$_ProjectsControllerBaseActionController =
      ActionController(name: '_ProjectsControllerBase');

  @override
  dynamic setState(ProjectState value) {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTypeState(ProjectTypeState value) {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.setTypeState');
    try {
      return super.setTypeState(value);
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
projectTypeState: ${projectTypeState},
listProjects: ${listProjects},
listTypes: ${listTypes}
    ''';
  }
}
