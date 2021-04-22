// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailViewModel on _ProductDetailViewModelBase, Store {
  final _$quantityAtom = Atom(name: '_ProductDetailViewModelBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$_ProductDetailViewModelBaseActionController =
      ActionController(name: '_ProductDetailViewModelBase');

  @override
  void changeQuantity(int newQuantity) {
    final _$actionInfo = _$_ProductDetailViewModelBaseActionController
        .startAction(name: '_ProductDetailViewModelBase.changeQuantity');
    try {
      return super.changeQuantity(newQuantity);
    } finally {
      _$_ProductDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity}
    ''';
  }
}
