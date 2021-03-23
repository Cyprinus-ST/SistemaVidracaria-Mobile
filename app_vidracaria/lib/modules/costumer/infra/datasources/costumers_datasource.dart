import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/deleteCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/editCostumerInput.dart';
import 'package:dartz/dartz.dart';

abstract class CostumersDatasource {
  Future<void> addClient(AddCostumerInput input);
  Future<List<Costumer>> listClients(String idUser);
  Future<void> editCostumer(EditCostumerInput input);
  Future<void> deleteCostumer(DeleteCostumerInput input);
}