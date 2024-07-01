// data/models/book.dart
import 'package:json_annotation/json_annotation.dart';
import 'person.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  final int id;
  final String title;
  final List<String> subjects;
  final List<Person> authors;
  final List<Person> translators;
  final List<String> bookshelves;
  final List<String> languages;
  final bool? copyright;
  final String? mediaType;
  final Map<String, String> formats;
  final int? downloadCount;

  // New parameter to track like status
  bool liked;

  Book({
    required this.id,
    required this.title,
    required this.subjects,
    required this.authors,
    required this.translators,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
    this.liked = false, // Default value for isLiked
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}


