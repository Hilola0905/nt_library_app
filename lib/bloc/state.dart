import 'package:dio_example/data/models/users_model.dart';
import 'package:nt_library_app/model/book_model.dart';

abstract class BooksState {}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class BooksLoadedState extends BooksState {
  final List<BookModel> users;

  BooksLoadedState({required this.users});
}

class BooksErrorState extends BooksState {
  final String message;
  BooksErrorState({required this.message});
}

class BooksEmptyState extends BooksState {}