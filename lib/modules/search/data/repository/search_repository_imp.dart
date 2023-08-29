import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/domain/entities/product_entity.dart';
import '../../domain/enum/search_type_enum.dart';
import '../../domain/repository/search_repository.dart';
import '../datasource/local_search_datasource.dart';
import '../datasource/remote_search_datasource.dart';

class SearchRepositoryImp extends SearchRepository {
  final LocalSearchDatasource _localSearchDatasource;
  final RemoteSearchDatasource _remoteSearchDatasource;

  SearchRepositoryImp(this._localSearchDatasource, this._remoteSearchDatasource);

  @override
  Future<Either<Failure, List<String>>> fetchHistory() async {
    try {
      var response = await _localSearchDatasource.fetchHistory();
      return Right(response);
    } on Failure catch (_) {
      return Left(Failure());
    } on Exception {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveToHistory(String search) async {
    try {
      await _localSearchDatasource.saveToHistory(search);
      return const Right(unit);
    } on Failure catch (_) {
      return Left(Failure());
    } on Exception {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> search(String search, {SearchType? searchType}) async {
    try {
      final response = await _remoteSearchDatasource.search(search, searchType: searchType);
      return Right(response);
    } on Failure catch (_) {
      return Left(Failure());
    } on Exception {
      return Left(Failure());
    }
  }
}
