import 'dart:convert';

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

 List<Book> bookFromJson(String str) =>
      List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

  String userModelToJson(List<Book> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Book {
  String id;
  String? isbn;
  String? ean13;
  String title;
  String? author;
  String? edition;
  String description;
  int? year;
  List<String> language;
  int? numberOfPages;
  String? coverPhoto;
  BookStatus status;
  String createdBy;
  String createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedBy;
  String? deletedAt;

  Book({
    required this.id,
    required this.isbn,
    required this.ean13,
    required this.title,
    required this.author,
    required this.edition,
    required this.description,
    required this.year,
    required this.language,
    required this.numberOfPages,
    required this.coverPhoto,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.deletedBy,
    this.deletedAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      isbn: json['isbn'],
      ean13: json['ean13'],
      title: json['title'],
      author: json['author'],
      edition: json['edition'],
      description: json['description'],
      year: json['year'],
      language: List<String>.from(json['language']),
      numberOfPages: json['numberOfPages'],
      coverPhoto: json['coverPhoto'],
      status: BookStatusExtension.fromValue(json['status']),
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      updatedBy: json['updatedBy'],
      updatedAt: json['updatedAt'],
      deletedBy: json['deletedBy'],
      deletedAt: json['deletedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "isbn": isbn,
        "ean13": ean13,
        "title": title,
        "author": author,
        "edition": edition,
        "description": description,
        "year": year,
        "language": language,
        "numberOfPages": numberOfPages,
        "coverPhoto": coverPhoto,
        "status": status.value,
        "createdBy": createdBy,
        "createdAt": createdAt,
        "updatedBy": updatedBy,
        "updatedAt": updatedAt,
        "deletedBy": deletedBy,
        "deletedAt": deletedAt,
      };
}
