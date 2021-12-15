import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/product_model.dart';
import '../helpers/enum.dart';
import '../services/store_page_service.dart';

class StorePageViewModel extends ChangeNotifier{
   final StorePageService _storePageService = StorePageService();

   Status _status = Status.init;

   Status get status => _status;

   late List<ProductModel> _products;

   List<ProductModel> get products => _products;

   Future<void> _setProducts(List<ProductModel> products) async {
     _products = products;
     _status = Status.success;
     notifyListeners();
   }

   late ShowError _error;

   ShowError get error => _error;

   void _setError(ShowError error) {
     _error = error;
     notifyListeners();
   }

   fetchProductList() async {
     try {
       _status = Status.loading;
       _setProducts(await _storePageService.fetchProducts());
     } on ShowError catch (error) {
       _status = Status.error;
       _setError(error);
     }
     notifyListeners();
   }
}