// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordController on _ForgotPasswordControllerBase, Store {
  final _$stateAtom = Atom(name: '_ForgotPasswordControllerBase.state');

  @override
  ForgotPasswordState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ForgotPasswordState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$doForgotPasswordAsyncAction =
      AsyncAction('_ForgotPasswordControllerBase.doForgotPassword');

  @override
  Future doForgotPassword(ForgotPasswordInput input) {
    return _$doForgotPasswordAsyncAction
        .run(() => super.doForgotPassword(input));
  }

  final _$_ForgotPasswordControllerBaseActionController =
      ActionController(name: '_ForgotPasswordControllerBase');

  @override
  dynamic setState(ForgotPasswordState value) {
    final _$actionInfo = _$_ForgotPasswordControllerBaseActionController
        .startAction(name: '_ForgotPasswordControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
