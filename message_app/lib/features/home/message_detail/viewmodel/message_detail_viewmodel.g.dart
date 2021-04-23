// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_detail_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MessageDetailViewModel on _MessageDetailViewModelBase, Store {
  final _$refreshAtom = Atom(name: '_MessageDetailViewModelBase.refresh');

  @override
  bool get refresh {
    _$refreshAtom.reportRead();
    return super.refresh;
  }

  @override
  set refresh(bool value) {
    _$refreshAtom.reportWrite(value, super.refresh, () {
      super.refresh = value;
    });
  }

  final _$_MessageDetailViewModelBaseActionController =
      ActionController(name: '_MessageDetailViewModelBase');

  @override
  void getMessages() {
    final _$actionInfo = _$_MessageDetailViewModelBaseActionController
        .startAction(name: '_MessageDetailViewModelBase.getMessages');
    try {
      return super.getMessages();
    } finally {
      _$_MessageDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendMessage(String messageContent, User sender) {
    final _$actionInfo = _$_MessageDetailViewModelBaseActionController
        .startAction(name: '_MessageDetailViewModelBase.sendMessage');
    try {
      return super.sendMessage(messageContent, sender);
    } finally {
      _$_MessageDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void receivedMessage(Message message) {
    final _$actionInfo = _$_MessageDetailViewModelBaseActionController
        .startAction(name: '_MessageDetailViewModelBase.receivedMessage');
    try {
      return super.receivedMessage(message);
    } finally {
      _$_MessageDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSubmitMessage(String value) {
    final _$actionInfo = _$_MessageDetailViewModelBaseActionController
        .startAction(name: '_MessageDetailViewModelBase.onSubmitMessage');
    try {
      return super.onSubmitMessage(value);
    } finally {
      _$_MessageDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
refresh: ${refresh}
    ''';
  }
}
