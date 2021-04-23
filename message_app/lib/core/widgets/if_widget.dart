import 'package:flutter/widgets.dart';

class If extends StatelessWidget {
  final bool condition;
  final Widget widget;

  /// ```dart
  /// If(condition: isLoading, widget: Loader())
  /// ```
  const If({required this.condition, required this.widget});

  @override
  Widget build(BuildContext context) {
    return condition ? widget : SizedBox();
  }
}
