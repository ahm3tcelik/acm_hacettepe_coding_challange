import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../extensions/string_extensions.dart';
import '../models/chat_model.dart';
import '../models/user_model.dart';
import 'avatar.dart';

//TODO: LANG
class ChatCardItem extends StatelessWidget {
  final User targetUser;
  final Chat chat;
  final VoidCallback? onTap;

  const ChatCardItem({
    Key? key,
    required this.chat,
    required this.targetUser,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Hero(tag: targetUser.userId.avatarTag, child: Avatar(user: targetUser)),
      title: Text(targetUser.userName.orEmpty,
          style: context.textTheme.headline6),
      subtitle: Text(
        chat.messages?.last.messageContent ?? '',
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _buildTimeAgo(context)),
          Expanded(child: _buildUnReadMessagesNum(context))
        ],
      ),
    );
  }

  Widget _buildTimeAgo(BuildContext context) {
    final diff = DateTime.now().difference(DateTime.parse(chat.messages?.last.sendTime ?? ''));
    var diffText = '';
    if (diff.inDays > 0) {
      diffText = '${diff.inDays} day';
    }
    else if (diff.inHours > 0){
      diffText = '${diff.inHours} hour';
    }
    else if (diff.inMinutes > 0) {
      diffText = '${diff.inMinutes} min';
    }
    else {
      diffText = 'Now';
    }
    return Text(
      diffText,
      style: context.textTheme.bodyText1!
          .copyWith(color: context.appTheme.primaryColor),
    );
  }

  Widget _buildUnReadMessagesNum(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.appTheme.primaryColor,
      child: Text(
        '${(chat.messages ?? []).length}',
        style: context.textTheme.bodyText1!
            .copyWith(color: context.colorScheme.onPrimary),
      ),
    );
  }
}
