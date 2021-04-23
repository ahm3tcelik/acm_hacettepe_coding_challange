// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    messageId: json['messageId'] as int?,
    messageContent: json['messageContent'] as String?,
    senderId: json['senderId'] as String?,
    receiverId: json['receiverId'] as String?,
    receiveTime: json['receiveTime'] as String?,
    sendTime: json['sendTime'] as String?,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'messageId': instance.messageId,
      'messageContent': instance.messageContent,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'sendTime': instance.sendTime,
      'receiveTime': instance.receiveTime,
    };
