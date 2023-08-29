import 'package:shared_preferences/shared_preferences.dart';

import '../local_search_datasource.dart';

class LocalSearchDatasourceImp extends LocalSearchDatasource {
  static const _historyKey = 'search_history';
  static const _maxHistorySize = 15;

  @override
  Future<List<String>> fetchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_historyKey) ?? [];
    return history.toList();
  }

  @override
  Future<void> saveToHistory(String search) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = await fetchHistory();

      history = [search, ...history];

      if (history.length > _maxHistorySize) {
        history.removeRange(history.length - _maxHistorySize, history.length);
      }

      await prefs.setStringList(_historyKey, history);
    
  }
}
