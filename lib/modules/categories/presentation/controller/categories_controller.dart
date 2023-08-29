import 'package:corelab_app_challenge/core/routes/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriesController {
  void searchForCategory(String categoryName) {
    Modular.to.pushNamed(AppRoutes.search, arguments: categoryName);
  }
}
