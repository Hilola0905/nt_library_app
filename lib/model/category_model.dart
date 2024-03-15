class Book {
  int categoryId;
  String name;

  Book({
    required this.categoryId,
    required this.name,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      categoryId: json['category_id']as int? ?? 0,
      name: json['name']as String? ?? '',
    );
  }
}
