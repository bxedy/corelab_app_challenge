import 'package:corelab_app_challenge/modules/home/data/datasources/home_datasource.dart';
import 'package:corelab_app_challenge/modules/home/data/datasources/remote/home_datasource_imp.dart';
import 'package:corelab_app_challenge/modules/home/data/repositories/home_repository_imp.dart';
import 'package:corelab_app_challenge/modules/home/domain/repositories/home_repository.dart';
import 'package:corelab_app_challenge/modules/home/domain/usecases/fetch_data_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/app_routes.dart';
import 'presentation/controllers/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<IHomeController>(
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
