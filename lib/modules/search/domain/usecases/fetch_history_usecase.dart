import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repository/search_repository.dart';

abstract class FetchHistoryUsecase {
  Future<Either<Failure, List<String>>> call();
}

class FetchHistoryUsecaseImp extends FetchHistoryUsecase {
  final SearchRepository _searchRepository;

  FetchHistoryUsecaseImp(this._searchRepository);
  @override
  Future<Either<Failure, List<String>>> call() async {
    return await _searchRepository.fetchHistory();
  }
}
