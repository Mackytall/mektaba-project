// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
    List<Book> book;

    Books({
        required this.book,
    });

    factory Books.fromJson(Map<String, dynamic> json) => Books(
        book: List<Book>.from(json["book"].map((x) => Book.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "book": List<dynamic>.from(book.map((x) => x.toJson())),
    };
}

class Book {
    String id;
    String title;
    String author;
    String description;
    int year;
    String language;
    int numberOfPages;
    String edition;
    String state;
    String coverPhoto;
    String status;
    String isbn;
    String ean13;
    String createdBy;
    List<dynamic>? acceptedRoles;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Book({
        required this.id,
        required this.title,
        required this.author,
        required this.description,
        required this.year,
        required this.language,
        required this.numberOfPages,
        required this.edition,
        required this.state,
        required this.coverPhoto,
        required this.status,
        required this.isbn,
        required this.ean13,
        required this.createdBy,
       this.acceptedRoles,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["_id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        year: json["year"],
        language: json["language"],
        numberOfPages: json["numberOfPages"],
        edition: json["edition"],
        state: json["state"],
        coverPhoto: json["coverPhoto"],
        status: json["status"],
        isbn: json["isbn"],
        ean13: json["ean13"],
        createdBy: json["createdBy"],
        acceptedRoles: List<dynamic>.from(json["acceptedRoles"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "author": author,
        "description": description,
        "year": year,
        "language": language,
        "numberOfPages": numberOfPages,
        "edition": edition,
        "state": state,
        "coverPhoto": coverPhoto,
        "status": status,
        "isbn": isbn,
        "ean13": ean13,
        "createdBy": createdBy,
        // "acceptedRoles": List<dynamic>.from(acceptedRoles.map((x) => x)),
"acceptedRoles": acceptedRoles?.map((x) => x)?.toList(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
