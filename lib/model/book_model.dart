class BookModel {
  String uuid;
  String author;
  int categoryId;
  String description;
  String imgUrl;
  String name;
  double price;
  double rate;

  BookModel({
    required this.uuid,
    required this.author,
    required this.categoryId,
    required this.description,
    required this.imgUrl,
    required this.name,
    required this.price,
    required this.rate,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      uuid: json['_uuid'] as String? ?? '' ,
      author: json['author'] as String? ?? '',
      categoryId: json['category_id'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      imgUrl: json['img_url'] as String? ?? '',
      name: json['name']as String? ?? '',
      price: json['price'].toDouble(),
      rate: json['rate'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_uuid': uuid,
      'author': author,
      'category_id': categoryId,
      'description': description,
      'img_url': imgUrl,
      'name': name,
      'price': price,
      'rate': rate,
    };
  }
}
