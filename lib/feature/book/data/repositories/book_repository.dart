import 'package:injectable/injectable.dart';
import 'package:palm_code_mobile/feature/book/data/data_sources/book_data_source.dart';
import 'package:palm_code_mobile/feature/book/data/models/book.dart';

import '../../domain/repositories/book_repository.dart';

@LazySingleton(as: BookRepository)
class BookRepositoryImpl implements BookRepository {
  final ApiService apiService;

  BookRepositoryImpl(this.apiService);

  @override
  Future<List<Book>> getBooks({String query = '', int page = 1}) {
    return apiService.fetchBooks(query: query, page: page);
  }
}
