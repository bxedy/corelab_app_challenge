import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repository/search_repository.dart';

abstract class SaveToHistoryUsecase {
  Future<Either<Failure, Unit>> call(String search);
}

class SaveToHistoryUsecaseImp extends SaveToHistoryUsecase {
  final SearchRepository _searchRepository;

  SaveToHistoryUsecaseImp(this._searchRepository);
  @override
  Future<Either<Failure, Unit>> call(String search) async {
    return await _searchRepository.saveToHistory(search);
  }
}
