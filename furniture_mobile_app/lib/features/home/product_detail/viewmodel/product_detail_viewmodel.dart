import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../product/models/product_model.dart';
import '../../../../product/managers/basket_manager.dart';
import '../../../../product/managers/user_manager.dart';

part 'product_detail_viewmodel.g.dart';

class ProductDetailViewModel = _ProductDetailViewModelBase
    with _$ProductDetailViewModel;

abstract class _ProductDetailViewModelBase with Store {
  @observable
  int quantity = 1;

  BuildContext? context;

  @action
  void changeQuantity(int newQuantity) => quantity = newQuantity;

  void buyProduct(Product product) {
    context?.read<BasketManager>().increaseProduct(product, quantity);
  }

  bool isFavorite(UserManager manager, Product product) {
    return manager.isFavorite(product.productId);
  }

  void setFav(Product product, bool isChecked) {
    if (isChecked) {
      context?.read<UserManager>().addProductToFavorites(product);
    }
    else {
      context?.read<UserManager>().removeProductToFavorites(product);
    }
  }
}
