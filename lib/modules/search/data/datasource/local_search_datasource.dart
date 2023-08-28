abstract class LocalSearchDatasource {
  Future saveToHistory(String search);
  Future<List<String>> fetchHistory();
}
