import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/domain/entities/product_entity.dart';
import '../enum/search_type_enum.dart';

abstract class SearchRepository {
  Future<Either<Failure, Unit>> saveToHistory(String search);
  Future<Either<Failure, List<ProductEntity>>> search(String search, {SearchType? searchType});
  Future<Either<Failure, List<String>>> fetchHistory();
}
