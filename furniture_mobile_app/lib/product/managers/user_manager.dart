import 'package:flutter/cupertino.dart';

import '../../product/models/product_model.dart';
import '../models/user_model.dart';

class UserManager extends ChangeNotifier implements IUserManager {

  @override
  User? currentUser = User(
      id: 1,
      name: 'Courtney',
      surname: 'Henry',
      photoUrl: 'https://i.pravatar.cc/150?img=7');

  @override
  Set<Product>? favoriteProducts = {};

  @override
  bool isFavorite(int? productId) {
    if (productId == null) {
      return false;
    }
    return favoriteProducts
        ?.any((element) => element.productId == productId) ?? false;
  }

  @override
  void addProductToFavorites(Product product) {
    favoriteProducts?.add(product);
    notifyListeners();
  }

  @override
  void removeProductToFavorites(Product product) {
    favoriteProducts?.remove(product);
    notifyListeners();
  }
}

abstract class IUserManager {
  User? currentUser;
  Set<Product>? favoriteProducts;
  void addProductToFavorites(Product product);
  void removeProductToFavorites(Product product);
  bool isFavorite(int productId);
}
