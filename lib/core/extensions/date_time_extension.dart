extension DateTimeX on DateTime {
  /// Formats the [DateTime] object into a 'YYYY-MM-DD' string.
  ///
  /// This format is suitable for storing in databases and for date comparisons.
  String toNormalizedDateString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
  /// Formats the [DateTime] object into a 'HH:MM' string.
  /// This format is suitable for displaying time in a user-friendly way.
  String toNormalizedTimeString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
  /// Converts the [DateTime] object to a normalized DateTime object without time information.
  DateTime toNormalizedDateTime() {
    return DateTime(year, month, day);
  }

}
