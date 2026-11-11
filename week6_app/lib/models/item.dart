class Item {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String category;
  final DateTime createdAt;

  Item({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Immutable copyWith (excluding id and createdAt to protect data integrity)
  Item copyWith({
    String? title,
    String? subtitle,
    String? description,
    String? category,
  }) {
    return Item(
      id: this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      category: category ?? this.category,
      createdAt: this.createdAt,
    );
  }

  // Convert Item to JSON for SharedPreferences
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create Item from JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      category: json['category'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
