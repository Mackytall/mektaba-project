import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

enum BookStatus {
  draft,
  published,
  deleted,
}

extension BookStatusExtension on BookStatus {
  String get value {
    switch (this) {
      case BookStatus.draft:
        return 'draft';
      case BookStatus.published:
        return 'online';
      case BookStatus.deleted:
        return 'deleted';
    }
  }

  static BookStatus fromValue(String value) {
    switch (value) {
      case 'draft':
        return BookStatus.draft;
      case 'online':
        return BookStatus.published;
      case 'deleted':
        return BookStatus.deleted;
      default:
        throw ArgumentError('Unknown value: $value');
    }
  }
}

@JsonSerializable(explicitToJson: true)
class Book {
  @JsonKey(name: '_id')
  String id;
  String title;
  String author;
  String description;
  int year;
  List<String> language;
  int numberOfPages;
  String edition;
  String coverPhoto;
  BookStatus status;
  String isbn;
  String ean13;
  String createdBy;
  String? updatedBy;
  String? deletedBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.year,
    required this.language,
    required this.numberOfPages,
    required this.edition,
    required this.coverPhoto,
    required this.status,
    required this.isbn,
    required this.ean13,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.deletedBy,
  });

  /// Connect the generated [_$BookFromJson] function to the `fromJson`
  /// factory.
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  /// Connect the generated [_$BookToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
