import 'package:shared_preferences/shared_preferences.dart';

import '../local_search_datasource.dart';

class LocalSearchDataSourceImp extends LocalSearchDatasource {
  static const _historyKey = 'search_history';
  static const _maxHistorySize = 15;

  @override
  Future<List<String>> fetchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_historyKey) ?? [];
    return history.reversed.toList();
  }

  @override
  Future<void> saveToHistory(String search) async {
    final prefs = await SharedPreferences.getInstance();
    final history = await fetchHistory();

    if (!history.contains(search)) {
      history.add(search);

      if (history.length > _maxHistorySize) {
        history.removeRange(0, history.length - _maxHistorySize);
      }

      await prefs.setStringList(_historyKey, history);
    }
  }
}
