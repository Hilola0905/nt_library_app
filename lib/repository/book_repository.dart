import 'package:nt_library_app/model/book_model.dart';
import 'package:nt_library_app/network/network.dart';
import '../response/my_response.dart';

class BookRepo{

  ApiProvider apiProvider;

  BookRepo({required this.apiProvider});

  Future<MyResponse> getAllBooks()=> ApiProvider.getAllBooks();
  Future<MyResponse> addBook(BookModel bookModel)=> ApiProvider.addBook(bookModel);

}