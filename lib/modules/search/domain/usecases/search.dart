import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/domain/entities/product_entity.dart';
import '../repository/search_repository.dart';

abstract class SearchUsecase {
  Future<Either<Failure, List<ProductEntity>>> call(String search);
}

class SearchUsecaseImp extends SearchUsecase {
  final SearchRepository _searchRepository;

  SearchUsecaseImp(this._searchRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(String search) async {
    return await _searchRepository.search(search);
  }
}
