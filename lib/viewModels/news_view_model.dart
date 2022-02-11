import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/news_model.dart';
import 'package:noor/services/news_service.dart';

class NewsViewModel extends ChangeNotifier {
  final NewsService _newsService = NewsService();
  Status _status = Status.init;

  Status get status => _status;

  late List<NewsModel> _newsList;

  List<NewsModel> get newsList => _newsList;

  Future<void> _setNews(List<NewsModel> newsList) async {
    _newsList = newsList;
    _status = Status.success;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  fetch() async {
    try {
      _status = Status.loading;
      _setNews(await _newsService.fetchNews());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
