

import 'package:corelab_app_challenge/modules/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchData();
}
