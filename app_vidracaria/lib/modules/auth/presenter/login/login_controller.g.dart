// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$stateAtom = Atom(name: '_LoginControllerBase.state');

  @override
  LoginState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoginState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$userAuthenticadedAtom =
      Atom(name: '_LoginControllerBase.userAuthenticaded');

  @override
  UserAuthenticaded get userAuthenticaded {
    _$userAuthenticadedAtom.reportRead();
    return super.userAuthenticaded;
  }

  @override
  set userAuthenticaded(UserAuthenticaded value) {
    _$userAuthenticadedAtom.reportWrite(value, super.userAuthenticaded, () {
      super.userAuthenticaded = value;
    });
  }

  final _$doAuthenticateUserAsyncAction =
      AsyncAction('_LoginControllerBase.doAuthenticateUser');

  @override
  Future<dynamic> doAuthenticateUser(LoginInput input) {
    return _$doAuthenticateUserAsyncAction
        .run(() => super.doAuthenticateUser(input));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setState(LoginState value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
userAuthenticaded: ${userAuthenticaded}
    ''';
  }
}
