

import '../../domain/entities/product_entity.dart';

abstract class HomeDatasource {
  Future<List<ProductEntity>> fetchData();
}
