import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:message_app/product/managers/user_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/extensions/string_extensions.dart';
import '../../../../product/models/fake_data.dart';
import '../../../../product/models/user_model.dart';
import '../../../../product/widgets/avatar.dart';
import '../../../../product/models/chat_model.dart';
import '../../../../product/widgets/chat_card_item.dart';
import '../../message_detail/view/message_detail_view.dart';

class MessagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        LocaleKeys.app_name.tr(),
        style: context.textTheme.headline4!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(icon: Icon(CupertinoIcons.search), onPressed: () {}),
        IconButton(icon: Icon(CupertinoIcons.bars), onPressed: () {})
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.activity.tr(),
            style: context.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.normalValue),
          _buildActivities(context),
          SizedBox(height: context.normalValue),
          Text(
            LocaleKeys.messages,
            style: context.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.normalValue),
          Expanded(child: _buildChatList(context)),
        ],
      ),
    );
  }

  Widget _buildActivities(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1,
          mainAxisSpacing: 0,
        ),
        itemCount: users.length,
        itemBuilder: (context, index) =>
            _activityCardItem(context, users[index]),
      ),
    );
  }

  Widget _activityCardItem(BuildContext context, User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Avatar(user: user)),
        SizedBox(height: context.lowValue),
        Expanded(
            flex: 1,
            child: Text(
              user.userName.orEmpty,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }

  Widget _buildChatList(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(height: context.normalValue),
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        final targetUser = chat.targetUser(context.read<UserManager>().currentUser);
        if (targetUser == null) {
          return SizedBox();
        }
        return ChatCardItem(
          chat: chat,
          targetUser: targetUser,
          onTap: () => goToChatDetail(context, chat, targetUser),
        );
      },
    );
  }

  void goToChatDetail(BuildContext context, Chat? chat, User? targetUser) {
    if (chat == null || targetUser == null) {
      return;
    }
    Navigator.push(context,
      PageTransition(
        type: PageTransitionType.fade,
        child: MessageDetailView(chat: chat, targetUser: targetUser,),
      ),
    );
  }
}
