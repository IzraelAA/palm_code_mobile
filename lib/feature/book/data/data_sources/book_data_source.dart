// data/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../models/book.dart';

@Injectable()
class ApiService {
  static const String _baseUrl = 'http://gutendex.com';

  Future<List<Book>> fetchBooks({String query = '', int page = 1}) async {
  try{
    final response = await http.get(Uri.parse('$_baseUrl/books?search=$query&page=$page'));

    final data = json.decode(response.body);

    final books = (data['results'] as List).map((book) => Book.fromJson(book)).toList();
    return books;
  }catch(e){
    print(e);
    throw Exception('Failed to load books');

  }


  }
}
