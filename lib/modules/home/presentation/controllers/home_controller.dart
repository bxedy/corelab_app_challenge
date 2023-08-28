// Todos os tipos de cases que podem ser utilizados

import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:corelab_app_challenge/modules/home/domain/usecases/fetch_data_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/enums/pagestate_enum.dart';


class HomeController {
  final FetchDataUsecase _fetchDataUsecase;

  HomeController(this._fetchDataUsecase);

  ValueNotifier<PageState> pageState = ValueNotifier(PageState.initial);

  List<ProductEntity>? productsList;

  Future<void> fetchData() async {
    pageState.value = PageState.loading;
    final response = await _fetchDataUsecase();

    response.fold((failure) {
      pageState.value = PageState.error;
    }, (response) {
      pageState.value = PageState.success;

      productsList = response;
    });
  }
}
