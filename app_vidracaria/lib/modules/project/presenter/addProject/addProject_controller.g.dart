// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addProject_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddProjectController on _AddProjectControllerBase, Store {
  final _$stateAtom = Atom(name: '_AddProjectControllerBase.state');

  @override
  AddProjectState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AddProjectState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$doListProjectTypeAsyncAction =
      AsyncAction('_AddProjectControllerBase.doListProjectType');

  @override
  Future doListProjectType() {
    return _$doListProjectTypeAsyncAction.run(() => super.doListProjectType());
  }

  final _$doAddProjectAsyncAction =
      AsyncAction('_AddProjectControllerBase.doAddProject');

  @override
  Future<dynamic> doAddProject(AddProjectInput input) {
    return _$doAddProjectAsyncAction.run(() => super.doAddProject(input));
  }

  final _$_AddProjectControllerBaseActionController =
      ActionController(name: '_AddProjectControllerBase');

  @override
  dynamic setState(AddProjectState value) {
    final _$actionInfo = _$_AddProjectControllerBaseActionController
        .startAction(name: '_AddProjectControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_AddProjectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
