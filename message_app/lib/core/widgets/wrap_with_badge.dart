import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class WrapWithBadge extends StatelessWidget {
  final Widget child;
  final String? badgeLabel;
  final Color badgeLabelColor;
  final Color badgeColor;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  const WrapWithBadge({
    required this.child,
    this.badgeLabel,
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.badgeLabelColor = Colors.white,
    this.badgeColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: top,
          right: right,
          bottom: bottom,
          left: left,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(shape: BoxShape.circle, color: badgeColor),
            alignment: Alignment.center,
            child: Text(badgeLabel ?? '', style: context.textTheme.subtitle1!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
          ),
        )
      ],
    );
  }
}
