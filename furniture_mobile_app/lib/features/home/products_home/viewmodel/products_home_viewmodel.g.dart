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

  final _$fetchAllCategoriesAsyncAction =
      AsyncAction('_ProductsHomeViewModelBase.fetchAllCategories');

  @override
  Future<dynamic> fetchAllCategories() {
    return _$fetchAllCategoriesAsyncAction
        .run(() => super.fetchAllCategories());
  }

  final _$fetchAllProductsAsyncAction =
      AsyncAction('_ProductsHomeViewModelBase.fetchAllProducts');

  @override
  Future<dynamic> fetchAllProducts() {
    return _$fetchAllProductsAsyncAction.run(() => super.fetchAllProducts());
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
  void getProductsByCategoryId(int? categoryId) {
    final _$actionInfo =
        _$_ProductsHomeViewModelBaseActionController.startAction(
            name: '_ProductsHomeViewModelBase.getProductsByCategoryId');
    try {
      return super.getProductsByCategoryId(categoryId);
    } finally {
      _$_ProductsHomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchProductsByNameAndCategoryId(String key, int? categoryId) {
    final _$actionInfo =
        _$_ProductsHomeViewModelBaseActionController.startAction(
            name:
                '_ProductsHomeViewModelBase.searchProductsByNameAndCategoryId');
    try {
      return super.searchProductsByNameAndCategoryId(key, categoryId);
    } finally {
      _$_ProductsHomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategoryId: ${selectedCategoryId},
categoryViewState: ${categoryViewState},
productViewState: ${productViewState}
    ''';
  }
}
