import 'package:flutter/material.dart';

import '../../../shared/domain/entities/product_entity.dart';
import '../../domain/usecases/fetch_history_usecase.dart';
import '../../domain/usecases/save_to_history_usecase.dart';
import '../../domain/usecases/search.dart';

enum SearchPageState { initial, loading, error, success }

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
  final ValueNotifier<SearchPageState> pageState = ValueNotifier(SearchPageState.initial);
  final TextEditingController searchTextEditingController = TextEditingController();

  Future<void> fetchHistory() async {
    pageState.value = SearchPageState.loading;

    final response = await _fetchHistoryUsecase();
    response.fold((failure) {
      debugPrint(failure.message);
    }, (response) {
      pageState.value = SearchPageState.initial;

      searchHistory.addAll(response);
    });
  }

  Future<void> saveToHistory(String search) async {
    await _saveToHistoryUsecase(search);
    await fetchHistory();
  }

  void undoSearch() async {
    await Future.delayed(const Duration(seconds: 2));

    searchResults = [];
    await fetchHistory();
    pageState.value = SearchPageState.initial;
  }

  Future<void> fetchSearch(String search) async {
    pageState.value = SearchPageState.loading;

    saveToHistory(search);

    final response = await _searchUsecase(search);

    response.fold(
      (failure) {
        pageState.value = SearchPageState.error;
      },
      (response) {
        pageState.value = SearchPageState.success;
        searchResults.clear();
        searchResults.addAll(response);
      },
    );
  }
}
