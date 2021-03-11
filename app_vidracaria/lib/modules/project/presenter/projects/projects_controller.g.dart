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

  final _$_ProjectsControllerBaseActionController =
      ActionController(name: '_ProjectsControllerBase');

  @override
  dynamic doListProjects(FilterProjectInput input) {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.doListProjects');
    try {
      return super.doListProjects(input);
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
