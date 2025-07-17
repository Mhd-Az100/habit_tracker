class StatisticsModel {
  final String id;

  const StatisticsModel({required this.id});

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(id: json['id']);
  }

  Map<String, dynamic> toJson() => {'id': id};
}
