// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addCostumer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddCostumerController on _AddCostumerControllerBase, Store {
  final _$stateAtom = Atom(name: '_AddCostumerControllerBase.state');

  @override
  AddCostumerState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AddCostumerState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$doCreateClientAsyncAction =
      AsyncAction('_AddCostumerControllerBase.doCreateClient');

  @override
  Future<dynamic> doCreateClient(AddCostumerInput input) {
    return _$doCreateClientAsyncAction.run(() => super.doCreateClient(input));
  }

  final _$_AddCostumerControllerBaseActionController =
      ActionController(name: '_AddCostumerControllerBase');

  @override
  dynamic setState(AddCostumerState value) {
    final _$actionInfo = _$_AddCostumerControllerBaseActionController
        .startAction(name: '_AddCostumerControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_AddCostumerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
