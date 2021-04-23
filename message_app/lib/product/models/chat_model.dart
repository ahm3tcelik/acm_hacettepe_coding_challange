import 'package:json_annotation/json_annotation.dart';
import 'package:message_app/core/base/base_model.dart';

import 'message_model.dart';
import 'user_model.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class Chat extends BaseModel<Chat> {
  String? chatId;
  List<Message>? messages;
  final User? user1;
  final User? user2;

  Chat.createWithId({required this.user1, required this.user2, this.messages}) {
    if (user1!.userId.hashCode < user2!.userId.hashCode) {
      chatId = user1!.userId! + user2!.userId!;
    }
  }

  Chat({this.chatId, this.user1, this.user2, this.messages});

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChatToJson(this);

  User? targetUser(User? user) {
    if (user?.userId == user1?.userId) {
      return user2;
    } else {
      return user1;
    }
  }
}
