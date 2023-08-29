import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/app_routes.dart';
import 'presentation/controller/categories_controller.dart';
import 'presentation/pages/categories_page.dart';

class CategoriesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<CategoriesController>((i) => CategoriesController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.categories, child: ((context, args) =>  const CategoriesPage())),
  ];
}
