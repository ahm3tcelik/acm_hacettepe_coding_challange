import 'package:json_annotation/json_annotation.dart';

import '../../core/base/base_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User extends BaseModel<User> {
  final int id;
  final String name;
  final String surname;
  final String? photoUrl;

  User({
    required this.id,
    required this.name,
    required this.surname,
    this.photoUrl,
  });

  String get fullName => '$name $surname';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
