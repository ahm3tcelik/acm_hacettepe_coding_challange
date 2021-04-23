import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../extensions/string_extensions.dart';
import '../models/user_model.dart';

class Avatar extends StatelessWidget {
  final User? user;

  const Avatar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: context.appTheme.primaryColor, shape: BoxShape.circle),
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: context.appTheme.backgroundColor, shape: BoxShape.circle),
        child: CircleAvatar(
          backgroundColor: context.appTheme.backgroundColor,
          backgroundImage: NetworkImage(user?.avatarUrl.orDefault ?? ''),
        ),
      ),
    );
  }
}
