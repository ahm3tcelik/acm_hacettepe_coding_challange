import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:message_app/core/widgets/if_widget.dart';

import '../extensions/string_extensions.dart';
import '../models/user_model.dart';

class MessageCardItem extends StatelessWidget {
  final String messageContent;
  final bool isSelf;
  final bool isVisibleAvatar;
  final User sender;
  final DateTime time;

  const MessageCardItem(
      {Key? key,
      required this.messageContent,
      required this.isSelf,
      required this.isVisibleAvatar,
      required this.sender,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            If(condition: !isSelf, widget: _buildAvatar(context)),
            _buildTile(context),
            If(condition: isSelf, widget: _buildAvatar(context))
          ],
        ),
        If(condition: isVisibleAvatar, widget: _buildTime(context))
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.2),
      child: Visibility(
        visible: isVisibleAvatar,
        child: CircleAvatar(
          child: ClipOval(
            child: Image.network(sender.avatarUrl.orDefault),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context) =>
      isSelf ? _buildTileEnd(context) : _buildTileStart(context);

  Widget _buildTileStart(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      margin: context.verticalPaddingLow / 2,
      constraints: BoxConstraints(
          minWidth: context.dynamicWidth(0.2),
          maxWidth: context.dynamicWidth(0.7)),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topRight: context.lowRadius,
          bottomRight: context.lowRadius,
          topLeft: context.lowRadius,
        ),
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildTileEnd(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      margin: context.verticalPaddingLow / 2,
      constraints: BoxConstraints(
          minWidth: context.dynamicWidth(0.2),
          maxWidth: context.dynamicWidth(0.7)),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.only(
          topRight: context.lowRadius,
          bottomLeft: context.lowRadius,
          topLeft: context.lowRadius,
        ),
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      messageContent,
      textAlign: isSelf ? TextAlign.end : TextAlign.start,
      style: context.textTheme.bodyText1!.copyWith(
          color: isSelf
              ? context.colorScheme.onPrimary
              : context.colorScheme.onBackground),
    );
  }

  Widget _buildTime(BuildContext context) {
    return Text(DateFormat(DateFormat.HOUR24_MINUTE).format(time));
  }
}
