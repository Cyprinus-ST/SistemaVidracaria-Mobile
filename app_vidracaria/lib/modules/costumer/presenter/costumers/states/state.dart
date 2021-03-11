import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';

abstract class CostumersState {}

class CostumersStart implements CostumersState {}

class CostumersLoading implements CostumersState {}

class CostumersError implements CostumersState {
  final FailureCostumer error;

  CostumersError({this.error});
}

class CostumersSuccess implements CostumersState {
  final List<Costumer> costumers;

  CostumersSuccess(this.costumers);
}