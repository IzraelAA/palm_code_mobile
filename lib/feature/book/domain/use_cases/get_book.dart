
import 'package:injectable/injectable.dart';
import 'package:palm_code_mobile/feature/book/data/models/book.dart';

import '../repositories/book_repository.dart';

@Injectable()
class GetBooks {
  final BookRepository repository;

  GetBooks(this.repository);

  Future<List<Book>> call({String query = '', int page = 1}) {
    return repository.getBooks(query: query, page: page);
  }
}
