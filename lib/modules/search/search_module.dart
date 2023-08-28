import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/app_routes.dart';
import 'data/datasource/local/local_search_datasource_imp.dart';
import 'data/datasource/local_search_datasource.dart';
import 'data/datasource/remote/remote_search_datasource_imp.dart';
import 'data/datasource/remote_search_datasource.dart';
import 'data/repository/search_repository_imp.dart';
import 'domain/repository/search_repository.dart';
import 'domain/usecases/fetch_history_usecase.dart';
import 'domain/usecases/save_to_history_usecase.dart';
import 'domain/usecases/search.dart';
import 'presentation/controllers/search_controller.dart';
import 'presentation/pages/search_page.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<SearchControlller>(
      (i) => SearchControlller(
        i.get<SaveToHistoryUsecase>(),
        i.get<SearchUsecase>(),
        i.get<FetchHistoryUsecase>(),
      ),
    ),
    Bind.factory<LocalSearchDatasource>(
      (i) => LocalSearchDataSourceImp(),
    ),
    Bind.factory<RemoteSearchDatasource>(
      (i) => RemoteSearchDatasourceImp(),
    ),
    Bind.factory<FetchHistoryUsecase>(
      (i) => FetchHistoryUsecaseImp(
        i.get<SearchRepository>(),
      ),
    ),
    Bind.factory<SaveToHistoryUsecase>(
      (i) => SaveToHistoryUsecaseImp(
        i.get<SearchRepository>(),
      ),
    ),
    Bind.factory<SearchUsecase>(
      (i) => SearchUsecaseImp(
        i.get<SearchRepository>(),
      ),
    ),
    Bind.factory<SearchRepository>(
      (i) => SearchRepositoryImp(
        i.get<LocalSearchDatasource>(),
        i.get<RemoteSearchDatasource>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.search, child: ((context, args) => SearchPage(categoryToSearch: args.data))),
  ];
}
