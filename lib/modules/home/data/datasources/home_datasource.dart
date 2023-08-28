

import 'package:corelab_app_challenge/modules/home/domain/entities/product_entity.dart';

abstract class HomeDatasource {
  Future<List<ProductEntity>> fetchData();
}
