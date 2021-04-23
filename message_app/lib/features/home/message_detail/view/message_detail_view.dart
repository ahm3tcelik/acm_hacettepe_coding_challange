import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/base/base_view.dart';
import '../../../../product/models/message_model.dart';
import '../../../../product/widgets/message_card_item.dart';
import '../../../../product/extensions/string_extensions.dart';
import '../../../../product/models/chat_model.dart';
import '../../../../product/models/user_model.dart';
import '../../../../product/widgets/avatar.dart';
import '../viewmodel/message_detail_viewmodel.dart';


class MessageDetailView extends StatelessWidget {
  final Chat chat;
  final User targetUser;

  MessageDetailView({
    Key? key,
    required this.chat,
    required this.targetUser,
  });

  final _viewModel = MessageDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: _viewModel,
      onDispose: () => _viewModel.onDispose(),
      onModelReady: (model) => _viewModel.onInit(chat),
      onContextReady: (context) => _viewModel.context = context,
      onPageBuilder: (context, value) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: context.appTheme.primaryColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: context.dynamicHeight(0.15),
                alignment: Alignment.center,
                child: _buildTopBar(context),
              ),
              Expanded(child: _buildChatContainer(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingNormal,
      child: Row(
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Row(
              children: [
                _buildLeading(context),
                SizedBox(width: context.lowValue),
                _buildTitles(context),
              ],
            ),
          ),
          _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildShowStatus(BuildContext context) {
    return Text(
      '${(targetUser.isOnline ?? false) ? LocaleKeys.online.tr() : LocaleKeys.offline.tr()}',
      style: context.textTheme.subtitle2!
          .copyWith(color: context.colorScheme.onPrimary),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Hero(
      tag: targetUser.userId.avatarTag,
      child: Avatar(user: targetUser),
    );
  }

  Widget _buildTitles(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          targetUser.userName.orEmpty,
          style: context.textTheme.subtitle1!.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: context.lowValue),
        _buildShowStatus(context)
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.video_camera)),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.phone)),
      ],
    );
  }

  Widget _buildChatContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: context.normalRadius * 2,
          topRight: context.normalRadius * 2,
        ),
        color: context.appTheme.backgroundColor,
      ),
      padding: context.paddingNormal,
      child: Column(
        children: [
          _buildShowDate(context),
          SizedBox(height: context.lowValue),
          Expanded(child: _buildMessageListView(context)),
          _buildBottomButtons(context),
        ],
      ),
    );
  }

  Widget _buildShowDate(BuildContext context) {
    /// [example] Friday, April 23
    final date =
        DateFormat(DateFormat.MONTH_WEEKDAY_DAY).format(DateTime.now());
    return Text(date);
  }

  Widget _buildMessageListView(BuildContext context) {
    return Observer(
      builder: (context) {
        _viewModel.empty(_viewModel.refresh); // trigger ui
        return ListView(
          controller: _viewModel.scrollController,
          children: [
            for (var message in _viewModel.chatMessages)
              _buildMessageCard(context, message)
          ],
        );
      },
    );
  }

  Widget _buildMessageCard(BuildContext context, Message message) {
    return MessageCardItem(
        messageContent: message.messageContent ?? '',
        time: DateTime.parse(message.sendTime ?? ''),
        isSelf: _viewModel.currentUser.userId == message.senderId,
        isVisibleAvatar: _viewModel.isVisibleAvatar(message),
        sender: _viewModel.sender(message.senderId ?? ''));
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildSearchBox()),
        SizedBox(width: context.normalValue),
        _buildSendButton(context),
      ],
    );
  }

  Widget _buildSearchBox() {
    return TextField(
      controller: _viewModel.textController,
      onSubmitted: (value) => _viewModel.clearSearchText(),
      decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(CupertinoIcons.smiley),
          hintText: LocaleKeys.type_message.tr(),
          suffixIcon: Icon(Icons.attachment_outlined)),
    );
  }

  Widget _buildSendButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _viewModel.onSubmitMessage(_viewModel.textController.text);
      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all(context.paddingNormal),
          shape: MaterialStateProperty.all(CircleBorder())),
      child: Icon(Icons.send),
    );
  }
}
