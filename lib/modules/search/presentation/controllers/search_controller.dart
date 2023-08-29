import 'package:flutter/material.dart';

import '../../../../core/domain/debouncer.dart';
import '../../../../core/domain/enums/pagestate_enum.dart';
import '../../../shared/domain/entities/product_entity.dart';
import '../../domain/usecases/fetch_history_usecase.dart';
import '../../domain/usecases/save_to_history_usecase.dart';
import '../../domain/usecases/search.dart';

class SearchControlller {
  final SaveToHistoryUsecase _saveToHistoryUsecase;
  final SearchUsecase _searchUsecase;
  final FetchHistoryUsecase _fetchHistoryUsecase;

  SearchControlller(
    this._saveToHistoryUsecase,
    this._searchUsecase,
    this._fetchHistoryUsecase,
  );

  List<ProductEntity> searchResults = [];
  final List<String> searchHistory = [];
  final ValueNotifier<PageState> pageState = ValueNotifier(PageState.initial);
  final TextEditingController searchTextEditingController = TextEditingController();
  final Debouncer _searchDebouncer = Debouncer(const Duration(seconds: 1)); // Defina o atraso de 2 segundos

  Future<void> fetchHistory() async {
    pageState.value = PageState.loading;

    final response = await _fetchHistoryUsecase();
    response.fold((failure) {
      debugPrint(failure.message);
    }, (response) {
      pageState.value = PageState.initial;

      searchHistory.addAll(response);
    });
  }

  Future<void> saveToHistory(String search) async {
    await _saveToHistoryUsecase(search);
    await fetchHistory();
  }

  void undoSearch() async {
    await Future.delayed(const Duration(seconds: 4));

    searchResults = [];
    await fetchHistory();
    pageState.value = PageState.initial;
  }

  Future<void> search(String search) async {
    pageState.value = PageState.loading;

    _searchDebouncer.cancel();
    _searchDebouncer.run(() async {
      saveToHistory(search);

      final response = await _searchUsecase(search);

      response.fold(
        (failure) {
          pageState.value = PageState.error;
        },
        (response) {
          pageState.value = PageState.success;
          searchResults = response;
        },
      );
    });
  }
}
