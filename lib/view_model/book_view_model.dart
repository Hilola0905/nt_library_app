import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../model/book_model.dart';
import '../repository/book_repository.dart';
import '../response/my_response.dart';

class BookViewModel extends ChangeNotifier {
  List<BookModel> allBooks = [];
  String statusText = "";
  bool isLoading = false;

  BookViewModel({required this.productRepo}) {
    getAllBooks();
  }

  final BookRepo productRepo;

  Future<void> getAllBooks() async {
    _notify(true);
    MyResponse myResponse = await productRepo.getAllBooks();
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BookModel>;
      notifyListeners();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> addBook(BookModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await productRepo.addBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      notifyListeners();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> updateBook(BookModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await productRepo.updateBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      notifyListeners();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> deleteBook(String bookUUID) async {
    _notify(true);
    MyResponse myResponse = await productRepo.deleteBook(bookUUID);
    // notifyListeners();
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      notifyListeners();
    } else {
      statusText = myResponse.errorText;
    }
  }

  _notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
