import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';

abstract class AddCostumerState {

}

class AddCostumerStart implements AddCostumerState {}

class AddCostumerLoading implements AddCostumerState {}

class AddCostumerError implements AddCostumerState {
  final FailureCostumer error;

  AddCostumerError({this.error});
}

class AddCostumerSuccess implements AddCostumerState {
  AddCostumerSuccess();  
}