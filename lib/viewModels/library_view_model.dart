import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/book_model.dart';
import 'package:noor/services/book_service.dart';
import '../helpers/enum.dart';

class LibraryViewModel extends ChangeNotifier{
  final BookPageService _bookPageService = BookPageService();

  Status _status = Status.init;

  Status get status => _status;

  late List<BookModel> _books;

  List<BookModel> get books => _books;

  Future<void> _setBooks(List<BookModel> books) async {
    _books = books;
    _status = Status.success;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  fetchBooks() async {
    try {
      _status = Status.loading;
      _setBooks(await _bookPageService.fetchBooks());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}