import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/domain/entities/product_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../datasources/home_datasource.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDatasource _datasource;

  HomeRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchData() async {
    try {
      var response = await _datasource.fetchData();
      return Right(response);
    } on Failure catch (_) {
      return Left(Failure());
    } on Exception {
      return Left(Failure());
    }
  }
}
