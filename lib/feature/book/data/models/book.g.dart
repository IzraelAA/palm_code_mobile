// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      subjects:
          (json['subjects'] as List<dynamic>).map((e) => e as String).toList(),
      authors: (json['authors'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      translators: (json['translators'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookshelves: (json['bookshelves'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      copyright: json['copyright'] as bool?,
      mediaType: json['mediaType'] as String?,
      formats: Map<String, String>.from(json['formats'] as Map),
      downloadCount: (json['downloadCount'] as num?)?.toInt(),
      liked: json['liked'] as bool? ?? false,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subjects': instance.subjects,
      'authors': instance.authors,
      'translators': instance.translators,
      'bookshelves': instance.bookshelves,
      'languages': instance.languages,
      'copyright': instance.copyright,
      'mediaType': instance.mediaType,
      'formats': instance.formats,
      'downloadCount': instance.downloadCount,
      'liked': instance.liked,
    };
