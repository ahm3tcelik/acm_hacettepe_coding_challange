import 'package:flutter/widgets.dart';

class Ternary extends StatelessWidget {
  final bool condition;
  final Widget widgetTrue;
  final Widget widgetFalse;

  ///
  ///```dart
  ///  Ternary(
  ///    condition: isLoggedIn,
  ///    widgetTrue: Text('Logout'),
  ///    widgetFalse: Text('Login'),
  ///  )
  ///```
  const Ternary(
      {required this.condition,
      required this.widgetTrue,
      required this.widgetFalse});

  @override
  Widget build(BuildContext context) => condition ? widgetTrue : widgetFalse;
}
