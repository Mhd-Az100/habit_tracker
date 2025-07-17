import '../../domain/repositories/calendar_repository.dart';
import '../datasources/calendar_remote_datasource.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarRemoteDataSource remoteDataSource;

  CalendarRepositoryImpl(this.remoteDataSource);

  @override
  void fetchData() {
    // Example method
    remoteDataSource.fetchData();
  }
}
