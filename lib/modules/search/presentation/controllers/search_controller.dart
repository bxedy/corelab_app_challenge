import 'package:flutter/material.dart';

import '../../../../core/domain/enums/page_state_enum.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../shared/domain/entities/product_entity.dart';
import '../../domain/enum/search_type_enum.dart';
import '../../domain/usecases/fetch_history_usecase.dart';
import '../../domain/usecases/save_to_history_usecase.dart';
import '../../domain/usecases/search_usecase.dart';

class SearchControlller {
  final SaveToHistoryUsecase _saveToHistoryUsecase;
  final SearchUsecase _searchUsecase;
  final FetchHistoryUsecase _fetchHistoryUsecase;

  SearchControlller(
    this._saveToHistoryUsecase,
    this._searchUsecase,
    this._fetchHistoryUsecase,
  );

  ValueNotifier<List<ProductEntity>> searchResults = ValueNotifier([]);
  final ValueNotifier<PageState> pageState = ValueNotifier(PageState.initial);

  final TextEditingController searchTextEditingController = TextEditingController();

  final Debouncer _searchDebouncer = Debouncer(const Duration(seconds: 1));

  List<String> searchHistory = [];

  Future<void> fetchHistory() async {
    pageState.value = PageState.loading;

    final response = await _fetchHistoryUsecase();
    response.fold((failure) {
      debugPrint(failure.message);
    }, (response) {
      pageState.value = PageState.initial;

      searchHistory = [...response];
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
    searchTextEditingController.clear();
    searchResults.value = [];
    await fetchHistory();
    pageState.value = PageState.initial;
  }

  Future<void> search(String search, {SearchType? searchType}) async {
    _searchDebouncer.cancel();

    _searchDebouncer.run(() async {
      if (searchTextEditingController.text == '' || search == '') {
        return;
      }

      searchTextEditingController.text = search;

      pageState.value = PageState.loading;

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
