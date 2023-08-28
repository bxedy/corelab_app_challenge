// Todos os tipos de cases que podem ser utilizados

import 'package:corelab_app_challenge/modules/home/domain/entities/product_entity.dart';
import 'package:corelab_app_challenge/modules/home/domain/usecases/fetch_data_usecase.dart';
import 'package:flutter/material.dart';

enum HomePageState { initial, loading, error, success }

abstract class IHomeController extends ChangeNotifier {
  Future<void> fetchData();
  List<ProductEntity>? productsList;
  late ValueNotifier<HomePageState> pageState;
}

class HomeController extends IHomeController {
  final FetchDataUsecase _fetchDataUsecase;

  HomeController(this._fetchDataUsecase);

  @override
  ValueNotifier<HomePageState> pageState = ValueNotifier(HomePageState.initial);

  @override
  List<ProductEntity>? productsList;

  @override
  Future<void> fetchData() async {
    pageState.value = HomePageState.loading;
    final response = await _fetchDataUsecase();

    response.fold((failure) {
      pageState.value = HomePageState.error;
    }, (response) {
      pageState.value = HomePageState.success;

      productsList = response;
    });
  }
}
