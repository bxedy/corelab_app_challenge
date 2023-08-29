import 'package:corelab_app_challenge/modules/search/domain/enum/search_type_enum.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/domain/entities/product_entity.dart';
import '../repository/search_repository.dart';

abstract class SearchUsecase {
  Future<Either<Failure, List<ProductEntity>>> call(String search, {SearchType? searchType});
}

class SearchUsecaseImp extends SearchUsecase {
  final SearchRepository _searchRepository;

  SearchUsecaseImp(this._searchRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(String search, {SearchType? searchType}) async {
    return await _searchRepository.search(search, searchType: searchType);
  }
}
