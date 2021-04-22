import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../constants/custom_colors.dart';

class ProductFavButton extends StatelessWidget {
  final bool isFav;
  final Function(bool)? onSelected;

  const ProductFavButton({
    Key? key,
    required this.isFav,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.appTheme.cardColor,
      elevation: 1,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          if (onSelected != null) {
            onSelected!(!isFav);
          }
        },
        child: Padding(
          padding: context.paddingLow,
          child: Icon(
            isFav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            color: isFav ? CustomColors.crimson : context.appTheme.iconTheme.color,
          ),
        ),
      ),
    );
  }
}
