import '../model/book_model.dart';

abstract class BookEvent {}

class BookGetEvent extends BookEvent {}

class BookUpdateEvent extends BookEvent {}

class BookDeleteEvent extends BookEvent {}

class BookAddEvent extends BookEvent {
  final BookModel book;

  BookAddEvent({required this.book});
}