// Todos os tipos de cases que podem ser utilizados

import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:corelab_app_challenge/modules/home/domain/usecases/fetch_data_usecase.dart';
import 'package:flutter/material.dart';

enum HomePageState { initial, loading, error, success }

class HomeController {
  final FetchDataUsecase _fetchDataUsecase;

  HomeController(this._fetchDataUsecase);

  ValueNotifier<HomePageState> pageState = ValueNotifier(HomePageState.initial);

  List<ProductEntity>? productsList;

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
