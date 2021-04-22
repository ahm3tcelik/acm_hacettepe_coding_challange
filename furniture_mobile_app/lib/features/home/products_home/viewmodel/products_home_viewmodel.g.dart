// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsHomeViewModel on _ProductsHomeViewModelBase, Store {
  final _$selectedCategoryIdAtom =
      Atom(name: '_ProductsHomeViewModelBase.selectedCategoryId');

  @override
  int? get selectedCategoryId {
    _$selectedCategoryIdAtom.reportRead();
    return super.selectedCategoryId;
  }

  @override
  set selectedCategoryId(int? value) {
    _$selectedCategoryIdAtom.reportWrite(value, super.selectedCategoryId, () {
      super.selectedCategoryId = value;
    });
  }

  final _$categoryListAtom =
      Atom(name: '_ProductsHomeViewModelBase.categoryList');

  @override
  List<Category> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(List<Category> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$productListAtom =
      Atom(name: '_ProductsHomeViewModelBase.productList');

  @override
  List<Product> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(List<Product> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  final _$categoryViewStateAtom =
      Atom(name: '_ProductsHomeViewModelBase.categoryViewState');

  @override
  ViewState get categoryViewState {
    _$categoryViewStateAtom.reportRead();
    return super.categoryViewState;
  }

  @override
  set categoryViewState(ViewState value) {
    _$categoryViewStateAtom.reportWrite(value, super.categoryViewState, () {
      super.categoryViewState = value;
    });
  }

  final _$productViewStateAtom =
      Atom(name: '_ProductsHomeViewModelBase.productViewState');

  @override
  ViewState get productViewState {
    _$productViewStateAtom.reportRead();
    return super.productViewState;
  }

  @override
  set productViewState(ViewState value) {
    _$productViewStateAtom.reportWrite(value, super.productViewState, () {
      super.productViewState = value;
    });
  }

  final _$getAllCategoriesAsyncAction =
      AsyncAction('_ProductsHomeViewModelBase.getAllCategories');

  @override
  Future<dynamic> getAllCategories() {
    return _$getAllCategoriesAsyncAction.run(() => super.getAllCategories());
  }

  final _$getProductsByCategoryIdAsyncAction =
      AsyncAction('_ProductsHomeViewModelBase.getProductsByCategoryId');

  @override
  Future<dynamic> getProductsByCategoryId(int? categoryId) {
    return _$getProductsByCategoryIdAsyncAction
        .run(() => super.getProductsByCategoryId(categoryId));
  }

  final _$searchProductsByNameAndCategoryIdAsyncAction = AsyncAction(
      '_ProductsHomeViewModelBase.searchProductsByNameAndCategoryId');

  @override
  Future<dynamic> searchProductsByNameAndCategoryId(
      String key, int? categoryId) {
    return _$searchProductsByNameAndCategoryIdAsyncAction
        .run(() => super.searchProductsByNameAndCategoryId(key, categoryId));
  }

  final _$_ProductsHomeViewModelBaseActionController =
      ActionController(name: '_ProductsHomeViewModelBase');

  @override
  void changeCategoryId(int? categoryId) {
    final _$actionInfo = _$_ProductsHomeViewModelBaseActionController
        .startAction(name: '_ProductsHomeViewModelBase.changeCategoryId');
    try {
      return super.changeCategoryId(categoryId);
    } finally {
      _$_ProductsHomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategoryId: ${selectedCategoryId},
categoryList: ${categoryList},
productList: ${productList},
categoryViewState: ${categoryViewState},
productViewState: ${productViewState}
    ''';
  }
}