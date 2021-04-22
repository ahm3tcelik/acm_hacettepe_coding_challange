import 'package:flutter/cupertino.dart';
import 'package:furniture_mobile_app/product/managers/basket_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../product/models/product_model.dart';

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
}
