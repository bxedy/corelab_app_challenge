import 'package:corelab_app_challenge/modules/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/home_repository.dart';

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
