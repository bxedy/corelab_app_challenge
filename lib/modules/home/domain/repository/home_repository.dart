

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/domain/entities/product_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchData();
}
