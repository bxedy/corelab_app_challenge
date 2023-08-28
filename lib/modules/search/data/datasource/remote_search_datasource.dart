import '../../../shared/domain/entities/product_entity.dart';

abstract class RemoteSearchDatasource {
  Future<List<ProductEntity>> search(String search);
}
