class BookModel {
  final String bookId;
  final String bookLanguage;
  final String bookPath;
  final String bookTitle;
  final String bookAbout;
  final String bookFavourite;
  final String bookPublishDate;

  BookModel({required this.bookId,
    required this.bookLanguage,
    required this.bookPath,
    required this.bookTitle,
    required this.bookAbout,
    required this.bookFavourite,
    required this.bookPublishDate
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId: json['id'],
      bookLanguage: json['langauge'],
      bookPath: json['bookpath'],
      bookTitle: json['title'],
      bookAbout: json['about'],
      bookFavourite: json['favourite'],
      bookPublishDate: json['publishdate'],
    );
  }
}