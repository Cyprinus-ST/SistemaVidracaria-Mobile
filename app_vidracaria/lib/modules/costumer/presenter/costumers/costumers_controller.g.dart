// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'costumers_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CostumersController on _CostumersControllerBase, Store {
  final _$stateAtom = Atom(name: '_CostumersControllerBase.state');

  @override
  CostumersState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CostumersState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$doListCostumersAsyncAction =
      AsyncAction('_CostumersControllerBase.doListCostumers');

  @override
  Future<dynamic> doListCostumers() {
    return _$doListCostumersAsyncAction.run(() => super.doListCostumers());
  }

  final _$_CostumersControllerBaseActionController =
      ActionController(name: '_CostumersControllerBase');

  @override
  dynamic setState(CostumersState value) {
    final _$actionInfo = _$_CostumersControllerBaseActionController.startAction(
        name: '_CostumersControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_CostumersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
