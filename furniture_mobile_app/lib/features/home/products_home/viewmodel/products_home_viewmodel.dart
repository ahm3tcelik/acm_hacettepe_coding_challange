import 'package:furniture_mobile_app/product/models/category_model.dart';
import 'package:furniture_mobile_app/product/models/product_model.dart';
import 'package:mobx/mobx.dart';

part 'products_home_viewmodel.g.dart';

class ProductsHomeViewModel = _ProductsHomeViewModelBase
    with _$ProductsHomeViewModel;

abstract class _ProductsHomeViewModelBase with Store {
  final allCategory = Category(categoryId: 0, categoryName: 'All');

  @observable
  int? selectedCategoryId = 0;

  @observable
  List<Category> categoryList = [];

  @observable
  List<Product> productList = [];

  @observable
  ViewState categoryViewState = ViewState.INITIAL;

  @observable
  ViewState productViewState = ViewState.INITIAL;

  void onInit() {
    getAllCategories();
  }

  @action
  void changeCategoryId(int? categoryId) {
    selectedCategoryId = categoryId;
    getProductsByCategoryId(selectedCategoryId);
  }

  @action
  Future getAllCategories() async {
    categoryViewState = ViewState.BUSY;
    await Future.delayed(Duration(seconds: 2));
    categoryList = categories;
    categoryList.insert(0, allCategory);
    changeCategoryId(allCategory.categoryId);
    categoryViewState = ViewState.DATA;
  }

  @action
  Future getProductsByCategoryId(int? categoryId) async {
    productViewState = ViewState.BUSY;
    await Future.delayed(Duration(seconds: 2));
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
    await Future.delayed(Duration(seconds: 2));
    // SEARCH ALL
    if (categoryId == allCategory.categoryId || categoryId == null) {
      productList =
          products.where((p) => p.productName?.contains(key) ?? false).toList();
    }
    // SEARCH BY CATEGORY
    else {
      productList = products
          .where((p) =>
              p.categoryId == categoryId &&
              (p.productName?.contains(key) ?? false))
          .toList();
    }
    productViewState = ViewState.DATA;
  }

  bool isCategorySelected(int? categoryId) {
    return selectedCategoryId == categoryId && categoryId != null;
  }
}

enum ViewState { INITIAL, BUSY, DATA, ERROR }