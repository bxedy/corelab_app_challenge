import '../../../shared/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repository/home_repository.dart';

abstract class FetchDataUsecase {
  Future<Either<Failure, List<ProductEntity>>> call();
}

class FetchDataUsecaseImp implements FetchDataUsecase {
  final HomeRepository _repository;

  FetchDataUsecaseImp(this._repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await _repository.fetchData();
  }
}
