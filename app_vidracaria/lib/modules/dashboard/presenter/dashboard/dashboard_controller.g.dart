// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$stateAtom = Atom(name: '_DashboardControllerBase.state');

  @override
  DashboardState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(DashboardState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$userAtom = Atom(name: '_DashboardControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$doGetUserAuthenticadedAsyncAction =
      AsyncAction('_DashboardControllerBase.doGetUserAuthenticaded');

  @override
  Future<dynamic> doGetUserAuthenticaded() {
    return _$doGetUserAuthenticadedAsyncAction
        .run(() => super.doGetUserAuthenticaded());
  }

  final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase');

  @override
  dynamic setState(DashboardState value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
user: ${user}
    ''';
  }
}
