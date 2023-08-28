import '../../../shared/domain/entities/product_entity.dart';
import '../../domain/enum/search_type_enum.dart';

abstract class RemoteSearchDatasource {
  Future<List<ProductEntity>> search(String search, {SearchType? searchType = SearchType.byTitle});
}
