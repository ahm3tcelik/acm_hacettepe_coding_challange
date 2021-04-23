import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../product/managers/user_manager.dart';
import '../../../../product/models/chat_model.dart';
import '../../../../product/models/message_model.dart';
import '../../../../product/models/user_model.dart';

part 'message_detail_viewmodel.g.dart';

class MessageDetailViewModel = _MessageDetailViewModelBase
    with _$MessageDetailViewModel;

abstract class _MessageDetailViewModelBase with Store {
  var chatMessages = LinkedList<Message>();

  @observable
  bool refresh = false;

  final textController = TextEditingController();
  final scrollController = ScrollController();

  BuildContext? context;
  late Chat chat;

  void onInit(Chat _chat) {
    chat = _chat;
    getMessages();
  }

  void onDispose() {
    textController.dispose();
  }

  @action
  void getMessages() {
    if (chat.messages == null) {
      return;
    }
    chatMessages.addAll(chat.messages!);
  }

  @action
  void sendMessage(String messageContent, User sender) {
    chatMessages.add(Message(
      sendTime: DateTime.now().toString(),
      messageContent: messageContent.trim(),
      senderId: sender.userId,
    ));

    refresh = !refresh;
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @action
  void receivedMessage(Message message) {
    chatMessages.add(message);
    refresh = !refresh;
  }

  @action
  void onSubmitMessage(String value) {
    if (value.trim().isNotEmpty) {
      sendMessage(value.trim(), currentUser);
      textController.clear();
      refresh = !refresh;
    }
  }

  void clearSearchText() {
    textController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  bool isVisibleAvatar(Message message) {
    if (message.next == null) {
      return true;
    } else if (message.senderId == message.next?.senderId) {
      return false;
    }
    return true;
  }

  User get targetUser {
    final currentUser = context?.read<UserManager>().currentUser;
    return chat.targetUser(currentUser)!;
  }

  User get currentUser {
    return context!.read<UserManager>().currentUser!;
  }

  User sender(String senderId) {
    return currentUser.userId == senderId ? currentUser : targetUser;
  }

  String get currentUserId {
    return context?.read<UserManager>().currentUser?.userId ?? '';
  }

  void empty(bool refresh) {
    // empty.
  }
}
