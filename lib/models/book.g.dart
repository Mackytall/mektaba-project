// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      year: json['year'] as int,
      language: json['language'] as String,
      numberOfPages: json['numberOfPages'] as int,
      edition: json['edition'] as String,
      state: json['state'] as String,
      coverPhoto: json['coverPhoto'] as String,
      status: json['status'] as String,
      isbn: json['isbn'] as String,
      ean13: json['ean13'] as String,
      createdBy: json['createdBy'] as String,
      acceptedRoles: json['acceptedRoles'] as List<dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['v'] as int,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'year': instance.year,
      'language': instance.language,
      'numberOfPages': instance.numberOfPages,
      'edition': instance.edition,
      'state': instance.state,
      'coverPhoto': instance.coverPhoto,
      'status': instance.status,
      'isbn': instance.isbn,
      'ean13': instance.ean13,
      'createdBy': instance.createdBy,
      'acceptedRoles': instance.acceptedRoles,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'v': instance.v,
    };
