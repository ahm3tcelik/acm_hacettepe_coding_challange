import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../product/models/category_model.dart';
import '../../../../product/models/product_model.dart';

part 'products_home_viewmodel.g.dart';

class ProductsHomeViewModel = _ProductsHomeViewModelBase
    with _$ProductsHomeViewModel;

abstract class _ProductsHomeViewModelBase with Store {
  @observable
  int? selectedCategoryId = 0;

  @observable
  ViewState categoryViewState = ViewState.INITIAL;

  @observable
  ViewState productViewState = ViewState.INITIAL;

  BuildContext? context;
  final allCategory = Category(categoryId: 0, categoryName: 'All');
  final searchTextController = TextEditingController();

  var _categoryList = <Category>[];

  List<Category> get categoryList => [allCategory] + _categoryList;

  var productList = <Product>[];

  void onInit() {
    getAllCategories();
  }

  void onDispose() {
    searchTextController.dispose();
  }

  @action
  void changeCategoryId(int? categoryId) {
    selectedCategoryId = categoryId;
    getProductsByCategoryId(selectedCategoryId);
  }

  @action
  Future getAllCategories() async {
    categoryViewState = ViewState.BUSY;
    await Future.delayed(Duration(seconds:1));
    _categoryList = categories;
    changeCategoryId(allCategory.categoryId);
    categoryViewState = ViewState.DATA;
  }

  @action
  Future getProductsByCategoryId(int? categoryId) async {
    productViewState = ViewState.BUSY;
    await Future.delayed(Duration(seconds: 1));
    // GET ALL
    if (categoryId == allCategory.categoryId || categoryId == null) {
      productList = products;
    }
    // GET BY CATEGORY
    else {
      productList = products.where((p) => p.categoryId == categoryId).toList();
    }
    productViewState = ViewState.DATA;
  }

  @action
  Future searchProductsByNameAndCategoryId(String key, int? categoryId) async {
    productViewState = ViewState.BUSY;
    await Future.delayed(Duration(seconds: 1));
    // SEARCH ALL
    if (categoryId == allCategory.categoryId || categoryId == null) {
      productList = products
          .where((p) =>
              p.productName?.toLowerCase().contains(key.toLowerCase()) ?? false)
          .toList();
    }
    // SEARCH BY CATEGORY
    else {
      productList = products
          .where((p) =>
              p.categoryId == categoryId &&
              (p.productName?.toLowerCase().contains(key.toLowerCase()) ??
                  false))
          .toList();
    }
    productViewState = ViewState.DATA;
  }

  void onSubmitSearch(String key) {
    searchProductsByNameAndCategoryId(key, selectedCategoryId);
  }

  void clearSearchText() {
    searchTextController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    getProductsByCategoryId(selectedCategoryId);
  }

  bool isCategorySelected(int? categoryId) {
    return selectedCategoryId == categoryId && categoryId != null;
  }
}

enum ViewState { INITIAL, BUSY, DATA, ERROR }
