import 'statistics_local_datasource.dart';

class StatisticsLocalDataSourceImpl implements StatisticsLocalDataSource {
  @override
  Future<String> fetchCachedData() async {
    // TODO: Implement local data access
    return 'cached_statistics';
  }
}
