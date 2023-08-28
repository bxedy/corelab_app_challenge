import 'package:flutter/material.dart';

import '../../../../core/domain/debouncer.dart';
import '../../../../core/domain/enums/page_state_enum.dart';
import '../../../shared/domain/entities/product_entity.dart';
import '../../domain/enum/search_type_enum.dart';
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

  final List<String> searchHistory = [];
  ValueNotifier<List<ProductEntity>> searchResults = ValueNotifier([]);
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

  Future<void> onHistoryClick(String search) async {
    searchTextEditingController.text = search;

    this.search(search);
  }

  Future<void> saveToHistory(String search) async {
    await _saveToHistoryUsecase(search);
    await fetchHistory();
  }

  void undoSearch() async {
    await Future.delayed(const Duration(seconds: 4));

    searchResults.value = [];
    searchTextEditingController.clear();
    await fetchHistory();
    pageState.value = PageState.initial;
  }

  Future<void> search(String search, {SearchType? searchType = SearchType.byTitle}) async {
    searchTextEditingController.text = search;

    pageState.value = PageState.loading;

    _searchDebouncer.cancel();
    _searchDebouncer.run(() async {
      saveToHistory(search);

      final response = await _searchUsecase(search, searchType: searchType);

      response.fold(
        (failure) {
          pageState.value = PageState.error;
        },
        (response) {
          pageState.value = PageState.success;
          searchResults.value = [...response];
        },
      );
    });
  }
}
