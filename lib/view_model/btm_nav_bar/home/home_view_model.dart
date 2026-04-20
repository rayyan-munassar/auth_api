import 'package:auth_api_integration/models/product_model.dart';
import 'package:auth_api_integration/repository/products/products_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  final List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  int _skip = 0;
  final int _limit = 10;
  bool _hasMore = true;

  Future<void> getAllProducts({bool loadMore = false}) async {
    if (_isLoading || !_hasMore || _isLoadingMore) return;

    try {
      if (loadMore) {
        _isLoadingMore = true;
      } else {
        _isLoading = true;
        products.clear();
        _skip = 0;
        _hasMore = true;
      }

      notifyListeners();

      final newProducts = await ProductsRepository.getAllProducts(
        limit: _limit,
        skip: _skip,
      );

      if (newProducts.length < _limit) {
        _hasMore = false;
      }
      _products.addAll(newProducts);
      _skip += _limit;
    } catch (e) {
      throw Exception(e);
    }
    _isLoading = false;
    _isLoadingMore = false;
    notifyListeners();
  }
}
