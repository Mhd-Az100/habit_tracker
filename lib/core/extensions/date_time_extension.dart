extension DateTimeX on DateTime {
  /// Formats the [DateTime] object into a 'YYYY-MM-DD' string.
  ///
  /// This format is suitable for storing in databases and for date comparisons.
  String toNormalizedDateString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}
