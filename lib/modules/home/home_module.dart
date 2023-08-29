import 'data/datasources/home_datasource.dart';
import 'data/datasources/remote/home_datasource_imp.dart';
import 'data/repository/home_repository_imp.dart';
import 'domain/repository/home_repository.dart';
import 'domain/usecases/fetch_data_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/app_routes.dart';
import 'presentation/controllers/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<HomeController>(
      (i) => HomeController(
        i.get<FetchDataUsecase>(),
      ),
    ),
    Bind.factory<HomeDatasource>(
      (i) => HomeDatasourceImp(),
    ),
    Bind.factory<HomeRepository>(
      (i) => HomeRepositoryImp(
        i.get<HomeDatasource>(),
      ),
    ),
    Bind.factory<FetchDataUsecase>(
      (i) => FetchDataUsecaseImp(
        i.get<HomeRepository>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.home, child: ((context, args) => const HomePage())),
  ];
}
