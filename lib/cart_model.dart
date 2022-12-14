import 'package:flutter/cupertino.dart';

import 'product_model.dart';

class CartModel extends ChangeNotifier{
  List<Product> _lsProducts = [];

  add(Product product){
    _lsProducts.add(product);
    notifyListeners();
  }
  remove(Product product){
    _lsProducts.remove(product);
    notifyListeners();
  }
  getProducts() => _lsProducts;
  getCount() => _lsProducts.length;

  double get total {
    return _lsProducts.fold(0.0, (double currentTotal, Product nextProduct){
      return currentTotal + nextProduct.prix;
    });
    }
  }
