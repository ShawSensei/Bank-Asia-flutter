class CardInfoModel {
  final String? name;
  final String? id;
  final String? imagePath;
  final String? credit; // Add credit property
  final String? dueAmount; // Add dueAmount property
  final String? minimum; // Add minimum property
  final String? date; // Add date property

  CardInfoModel({
    this.name,
    this.id,
    this.imagePath,
    this.credit,
    this.dueAmount,
    this.minimum,
    this.date,
  });

  factory CardInfoModel.fromJson(Map<String, dynamic> json) {
    return CardInfoModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      imagePath: json['imagePath'] ?? '',
      credit: json['credit'] ?? '',
      // Initialize credit from JSON
      dueAmount: json['dueAmount'] ?? '',
      // Initialize dueAmount from JSON
      minimum: json['minimum'] ?? '',
      // Initialize minimum from JSON
      date: json['date'] ?? '', // Initialize date from JSON
    );
  }
}
