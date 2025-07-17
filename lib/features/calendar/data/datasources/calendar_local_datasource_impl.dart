import 'calendar_local_datasource.dart';

class CalendarLocalDataSourceImpl implements CalendarLocalDataSource {
  @override
  Future<String> fetchCachedData() async {
    // TODO: Implement local data access
    return 'cached_calendar';
  }
}
