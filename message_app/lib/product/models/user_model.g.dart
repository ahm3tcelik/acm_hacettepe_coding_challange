// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['userId'] as String?,
    userSurname: json['userSurname'] as String?,
    userName: json['userName'] as String?,
    isOnline: json['isOnline'] as bool?,
    avatarUrl: json['avatarUrl'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userSurname': instance.userSurname,
      'isOnline': instance.isOnline,
      'avatarUrl': instance.avatarUrl,
    };
