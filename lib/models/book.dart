class Book {
  String? isbn;
  String? title;
  String? category;
  String? description;
  String? author;
  String? ean13;
  String? publisher;
  int? year;
  String? language;
  int? pageNumber;
  bool? onlyAvailableOnSite = false;
  String? imagePath;

  Book({
    this.isbn,
    this.title,
    this.category,
    this.description,
    this.author,
    this.ean13,
    this.publisher,
    this.year,
    this.language,
    this.pageNumber,
    this.onlyAvailableOnSite,
    this.imagePath,
  });

}