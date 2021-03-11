import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/repositories/costumers_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ListCostumers {
  Future<Either<FailureCostumer, List<Costumer>>> call(String idUser);
}

class ListCostumersImpl implements ListCostumers {
  final CostumersRepository repository;

  ListCostumersImpl(this.repository);

  @override
  Future<Either<FailureCostumer, List<Costumer>>> call(String idUser) async {
    return await repository.listClients(idUser);
  }
}
