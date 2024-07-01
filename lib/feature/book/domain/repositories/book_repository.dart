

import 'package:palm_code_mobile/feature/book/data/models/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks({String query, int page});
}
