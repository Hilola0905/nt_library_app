class BookModel {
  String? uuid;
  String author;
  int categoryId;
  String description;
  String imgUrl;
  String name;
  double price;
  double rate;

  BookModel({
    this.uuid,
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
      uuid: json['_uuid'] as String? ?? '',
      author: json['author'] as String? ?? '',
      categoryId: json['category_id'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      imgUrl: json['img_url'] as String? ?? '',
      name: json['name'] as String? ?? '',
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

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "name": name,
      "price": price,
      "description": description,
      "rate": rate,
      "img_url": imgUrl,
      "_uuid": uuid,
      "category_id":categoryId,
    };
  }

  static bool canAddDatabase(BookModel bookModel){
    if(bookModel.name == ''){ return false;}
    if(bookModel.price == 0) {return false;}
    if(bookModel.imgUrl == '') {return false;}
    if(bookModel.author == ''){ return false;}
    return true;
  }

  BookModel copyWith({
    String? uuid,
    String? author,
    int? categoryId,
    String? description,
    String? imgUrl,
    String? name,
    double? price,
    double? rate,
  }) {
    return BookModel(
        uuid: uuid ?? this.uuid,
        author: author ?? this.author,
        categoryId: categoryId ?? this.categoryId,
        description: description ?? this.description,
        imgUrl: imgUrl ?? this.imgUrl,
        name: name ?? this.name,
        price: price ?? this.price,
        rate: rate ?? this.rate);
  }
}
