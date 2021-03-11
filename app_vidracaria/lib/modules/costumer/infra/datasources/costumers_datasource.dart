import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:dartz/dartz.dart';

abstract class CostumersDatasource {
  Future<void> addClient(AddCostumerInput input);
  Future<List<Costumer>> listClients(String idUser);
}