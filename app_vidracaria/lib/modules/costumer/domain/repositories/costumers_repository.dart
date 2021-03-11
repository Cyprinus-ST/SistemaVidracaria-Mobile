import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:dartz/dartz.dart';

abstract class CostumersRepository {
  Future<Either<FailureCostumer, void>> addClient(AddCostumerInput input);
  Future<Either<FailureCostumer, List<Costumer>>> listClients(String idUser);
  Future<Either<FailureCostumer, void>> getClient();
}