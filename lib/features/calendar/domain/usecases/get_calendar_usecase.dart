import '../repositories/calendar_repository.dart';

class GetCalendarUseCase {
  final CalendarRepository repository;

  GetCalendarUseCase(this.repository);

  void call() {
    repository.fetchData();
  }
}
