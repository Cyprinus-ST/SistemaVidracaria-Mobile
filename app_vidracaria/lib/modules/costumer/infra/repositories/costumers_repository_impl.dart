import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/domain/inputs/addCostumerInput.dart';
import 'package:app_vidracaria/modules/costumer/domain/errors/errors.dart';
import 'package:app_vidracaria/modules/costumer/domain/repositories/costumers_repository.dart';
import 'package:app_vidracaria/modules/costumer/infra/datasources/costumers_datasource.dart';
import 'package:dartz/dartz.dart';

class CostumersRepositoryImpl implements CostumersRepository {
  final CostumersDatasource datasource;

  CostumersRepositoryImpl(this.datasource);
  
  @override
  Future<Either<FailureCostumer, void>> addClient(AddCostumerInput input) async {
    try {
      return Right(await datasource.addClient(input));
    } on FailureCostumer catch (e) {
      return Left(e);
    } catch (e) {
      return left(DatasourceError());
    }
  }

  @override
  Future<Either<FailureCostumer, void>> getClient() {
    // TODO: implement getClient
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureCostumer, List<Costumer>>> listClients(String idUser) async {
    try {
      return Right(await datasource.listClients(idUser));
    } on FailureCostumer catch (e) {
      return Left(e);
    } catch (e) {
      return left(DatasourceError());
    }
  }

}