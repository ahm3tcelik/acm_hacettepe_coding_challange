import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/network/vexana_manager.dart';
import '../../../../product/managers/user_manager.dart';
import '../../../../product/models/category_model.dart';
import '../../../../product/models/product_model.dart';
import '../service/home_service.dart';

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
  late final IHomeService _homeService;
  final allCategory = Category(categoryId: 0, categoryName: 'All');
  final searchTextController = TextEditingController();

  var _categoryList = <Category>[];

  List<Category> get categoryList => [allCategory] + _categoryList;

  var _productList = <Product>[];
  var filteredProductList = <Product>[];

  void onInit() async {
    _homeService = HomeService.instance(VexanaManager.instance.networkManager);
    await fetchAllCategories();
    await fetchAllProducts();
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
  Future fetchAllCategories() async {
    if (categoryViewState == ViewState.BUSY) {
      return;
    }
    categoryViewState = ViewState.BUSY;
    final result = await _homeService.fetchCategories();
    if (result.data is List) {
      _categoryList = result.data ?? [];
      categoryViewState = ViewState.DATA;
    } else {
      categoryViewState = ViewState.ERROR;
    }
  }

  @action
  Future fetchAllProducts() async {
    if (productViewState == ViewState.BUSY) {
      return;
    }
    productViewState = ViewState.BUSY;
    final result = await _homeService.fetchProducts();
    if (result.data is List) {
      _productList = result.data ?? [];
      getProductsByCategoryId(selectedCategoryId);
    } else {
      productViewState = ViewState.ERROR;
    }
  }

  @action
  void getProductsByCategoryId(int? categoryId) {
    // GET ALL
    if (categoryId == allCategory.categoryId || categoryId == null) {
      filteredProductList = _productList;
    }
    // GET BY CATEGORY
    else {
      filteredProductList =
          _productList.where((p) => p.categoryId == categoryId).toList();
    }
    productViewState = ViewState.DATA;
  }

  @action
  void searchProductsByNameAndCategoryId(String key, int? categoryId) {
    // SEARCH ALL
    if (categoryId == allCategory.categoryId || categoryId == null) {
      filteredProductList = _productList
          .where((p) =>
              p.productName?.toLowerCase().contains(key.toLowerCase()) ?? false)
          .toList();
    }
    // SEARCH BY CATEGORY
    else {
      filteredProductList = _productList
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

  bool isFavorite(UserManager manager, Product product) {
    return manager.isFavorite(product.productId);
  }

  void setFav(Product product, bool isChecked) {
    if (isChecked) {
      context?.read<UserManager>().addProductToFavorites(product);
    } else {
      context?.read<UserManager>().removeProductToFavorites(product);
    }
  }
}

enum ViewState { INITIAL, BUSY, DATA, ERROR }
