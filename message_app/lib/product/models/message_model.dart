import 'package:json_annotation/json_annotation.dart';
import 'package:message_app/core/base/base_model.dart';

part 'message_model.g.dart';

@JsonSerializable()
class Message extends BaseModel<Message> {
  int? messageId;
  String? messageContent;
  String? senderId;
  String? receiverId;
  String? sendTime;
  String? receiveTime;

  String get chatId {
    return (senderId.hashCode < receiverId.hashCode)
        ? '$senderId$receiverId'
        : '$receiverId$senderId';
  }

  Message({
    this.messageId,
    this.messageContent,
    this.senderId,
    this.receiverId,
    this.receiveTime,
    this.sendTime
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
