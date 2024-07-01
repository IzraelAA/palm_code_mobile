part of 'book_bloc.dart';

enum BookStatus { initial, loading, loaded, pagination, error }

class BookState extends Equatable {
  final BookStatus status;
  final List<Book> books;
  final String errorMessage;

  const BookState({
    required this.status,
    this.books = const [],
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [status, books, errorMessage];

  BookState copyWith({
    BookStatus? status,
    List<Book>? books,
    String? errorMessage,
  }) {
    return BookState(
      status: status ?? this.status,
      books: books ?? this.books,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
