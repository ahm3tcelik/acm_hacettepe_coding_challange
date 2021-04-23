// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(
    chatId: json['chatId'] as String?,
    user1: json['user1'] == null
        ? null
        : User.fromJson(json['user1'] as Map<String, dynamic>),
    user2: json['user2'] == null
        ? null
        : User.fromJson(json['user2'] as Map<String, dynamic>),
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'chatId': instance.chatId,
      'messages': instance.messages,
      'user1': instance.user1,
      'user2': instance.user2,
    };
