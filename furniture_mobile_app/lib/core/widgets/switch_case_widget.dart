import 'package:flutter/widgets.dart';

class Case {
  final dynamic value;
  final Widget widget;

  ///```dart
  /// Case(value: 'customer', widget: _buildGreetCustomer),
  ///```
  Case({required this.widget, required this.value});
}

class SwitchCase extends StatelessWidget {
  final dynamic value;
  final List<Case> cases;
  final Widget? elseWidget;

  ///
  ///```dart
  ///  var role = 'admin';
  ///  return SwitchCase(
  ///    cases: [
  ///      Case(value: 'customer', widget: _buildGreetCustomer),
  ///      Case(value: 'developer', widget: _buildGreetDeveloper),
  ///      Case(value: 'admin', widget: _buildGreetAdmin)
  ///    ],
  ///    value: role,
  ///    elseWidget: Text('Unidentified'),
  ///  );
  ///```
  SwitchCase(
      {required this.value, required this.cases, required this.elseWidget});

  @override
  Widget build(BuildContext context) {
    var activeCase = cases.firstWhere((c) => c.value == value,
        orElse: () => Case(widget: elseWidget ?? SizedBox(), value: null));
    return activeCase.widget;
  }
}
