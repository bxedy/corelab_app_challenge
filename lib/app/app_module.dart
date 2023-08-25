import 'package:flutter_modular/flutter_modular.dart';

import '../modules/categories/categories_module.dart';
import '../modules/home/home_module.dart';

const appTransition = TransitionType.fadeIn;

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          transition: appTransition,
          module: HomeModule(),
        ),
        ModuleRoute(
          Modular.initialRoute,
          transition: appTransition,
          module: CategoriesModule(),
        ),
      ];
}
