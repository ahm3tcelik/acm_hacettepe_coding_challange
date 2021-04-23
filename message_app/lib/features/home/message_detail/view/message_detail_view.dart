import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:message_app/product/widgets/avatar.dart';

import '../../../../product/extensions/string_extensions.dart';
import '../../../../product/models/chat_model.dart';
import '../../../../product/models/user_model.dart';

//TODO: lang
class MessageDetailView extends StatelessWidget {
  final Chat chat;
  final User targetUser;

  const MessageDetailView({
    Key? key,
    required this.chat,
    required this.targetUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Hero(tag: targetUser.userId.avatarTag , child: Avatar(user: targetUser)),
                SizedBox(width: context.lowValue),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      targetUser.userName.orEmpty,
                      style: context.textTheme.subtitle1!.copyWith(
                          color: context.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: context.lowValue),
                    Text(
                      '${(targetUser.isOnline ?? false) ? 'Online' : 'Offline'}',
                      style: context.textTheme.subtitle2!
                          .copyWith(color: context.colorScheme.onPrimary),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.video_camera),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.phone),
              ),
            ],
          )
        ],
      ),
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
        children: [Text('Today - 16 Apr')],
      ),
    );
  }
}
