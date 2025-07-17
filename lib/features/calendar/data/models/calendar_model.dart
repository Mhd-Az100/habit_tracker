class CalendarModel {
  final String id;

  const CalendarModel({required this.id});

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(id: json['id']);
  }

  Map<String, dynamic> toJson() => {'id': id};
}
