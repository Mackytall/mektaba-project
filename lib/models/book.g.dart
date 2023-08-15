// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['_id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      year: json['year'] as int,
      language:
          (json['language'] as List<dynamic>).map((e) => e as String).toList(),
      numberOfPages: json['numberOfPages'] as int,
      edition: json['edition'] as String,
      coverPhoto: json['coverPhoto'] as String,
      status: $enumDecode(_$BookStatusEnumMap, json['status']),
      isbn: json['isbn'] as String,
      ean13: json['ean13'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      deletedBy: json['deletedBy'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'year': instance.year,
      'language': instance.language,
      'numberOfPages': instance.numberOfPages,
      'edition': instance.edition,
      'coverPhoto': instance.coverPhoto,
      'status': _$BookStatusEnumMap[instance.status]!,
      'isbn': instance.isbn,
      'ean13': instance.ean13,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'deletedBy': instance.deletedBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$BookStatusEnumMap = {
  BookStatus.draft: 'draft',
  BookStatus.published: 'published',
  BookStatus.deleted: 'deleted',
};
