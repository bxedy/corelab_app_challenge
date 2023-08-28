import '../../../home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class SearchRepository {
  Future<Either<Failure, Unit>> saveToHistory(String search);
  Future<Either<Failure, List<ProductEntity>>> search(String search);
  Future<Either<Failure, List<String>>> fetchHistory();
}
