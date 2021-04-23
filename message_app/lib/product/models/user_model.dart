import 'package:json_annotation/json_annotation.dart';
import 'package:message_app/core/base/base_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User extends BaseModel<User> {
  String? userId;
  String? userName;
  String? userSurname;
  bool? isOnline;
  String? avatarUrl;

  User({
    this.userId,
    this.userSurname,
    this.userName,
    this.isOnline,
    this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
