import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class BasketManager extends ChangeNotifier implements IBasketManager  {
  @override
  Map<Product, int?> get basket => _basket;
  final _basket = <Product, int?>{};

  @override
  int get productCount {
    var sum = 0;
    _basket.values.forEach((quantity) {
      sum += (quantity ?? 0);
    });
    return sum;
    /// same operation -> less readable
    /// _basket.values.reduce((value, element) => (value ?? 0) + (element ?? 0)) ?? 0;
  }

  @override
  double get totalPrice {
    var sum = 0.0;
    _basket.entries.forEach((item) {
      // unit price * quantity
      sum += (item.key.price ?? 0) * (item.value ?? 0);
    });
    return sum;
  }

  @override
  void decreaseProduct(Product product, int decrementQuantity) {
    if (_basket[product] != null) {
      _basket[product] = _basket[product]! - decrementQuantity;
      notifyListeners();
      if (_basket[product]! <= 1) {
        _basket[product] = null;
      }
    }
  }

  @override
  void increaseProduct(Product product, int incrementQuantity) {
    // initial quantity of product
    if (_basket[product] == null) {
      _basket[product] = incrementQuantity;
    } else {
      _basket[product] = _basket[product]! + incrementQuantity;
    }
    notifyListeners();
  }

  @override
  void putQuantityToProduct(Product product, int quantity) {
    _basket[product] = quantity;
    notifyListeners();
  }

  @override
  void clearBasket() {
    _basket.clear();
    notifyListeners();
  }
}

abstract class IBasketManager {
  Map<Product, int?> get basket;

  double get totalPrice;

  int get productCount;

  void increaseProduct(Product product, int incrementQuantity);

  void decreaseProduct(Product product, int decrementQuantity);

  void putQuantityToProduct(Product product, int quantity);

  void clearBasket();
}
