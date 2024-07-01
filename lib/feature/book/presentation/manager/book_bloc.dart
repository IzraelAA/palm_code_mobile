import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:palm_code_mobile/feature/book/data/models/book.dart';
import 'package:palm_code_mobile/feature/book/domain/use_cases/get_book.dart';

part 'book_state.dart';

@LazySingleton()
class BookCubit extends Cubit<BookState> {
  final GetBooks getBooks;

  BookCubit(this.getBooks) : super(BookState(status: BookStatus.initial));

  void fetchBooks({required String query, required int page}) async {
    emit(state.copyWith(status: BookStatus.loading));

    print(state.status);
    try {
      final books = await getBooks(query: query, page: page);
      final updatedBooks = List<Book>.from(state.books)..addAll(books);

      emit(state.copyWith(
        status: BookStatus.loaded,
        books: updatedBooks,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BookStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void isLikedBooks() {
    emit(state.copyWith(status: BookStatus.loading));
  }

  void toggleLikeBook(int index) {
    emit(state.copyWith(status: BookStatus.loading));
    try {
      final updatedBooks = state.books;
      print(index);
      updatedBooks[index].liked = !updatedBooks[index].liked;

      print(updatedBooks[index].liked);
      emit(state.copyWith(
        books: updatedBooks,
        status: BookStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BookStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
