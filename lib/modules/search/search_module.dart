import 'package:corelab_app_challenge/modules/search/presentation/pages/search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/app_routes.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.search, child: ((context, args) => const SearchPage())),
  ];
}
