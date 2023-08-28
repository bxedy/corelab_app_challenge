import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/app_routes.dart';
import 'presentation/controllers/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<IHomeController>((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.home, child: ((context, args) => const HomePage())),
  ];
}
