import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NumberCounterButton extends StatefulWidget {
  final Function(int)? onChanged;
  final double? width;
  final double? height;
  final int minValue;

  const NumberCounterButton({
    Key? key,
    this.onChanged,
    this.width,
    this.height,
    this.minValue = 1
  }) : super(key: key);

  @override
  _NumberCounterButtonState createState() => _NumberCounterButtonState();
}

class _NumberCounterButtonState extends State<NumberCounterButton> {

  int value = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 30,
      width: widget.width ?? 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 1, child: _buildDecrease(context)),
          Expanded(flex: 2, child: _buildShowValue(context)),
          Expanded(flex: 1, child: _buildIncrease(context)),
        ],
      ),
    );
  }

  Widget _buildDecrease(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: context.lowRadius,
            bottomLeft: context.lowRadius,
          ),
          color: Colors.grey),
      child: InkWell(
        onTap: () {
          if (value > widget.minValue) {
            setState(() {
              value--;
              widget.onChanged?.call(value);
            });
          }
        },
        child: Icon(Icons.remove, color: context.colorScheme.onPrimary),
      ),
    );
  }

  Widget _buildIncrease(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: context.lowRadius,
            bottomRight: context.lowRadius,
          ),
          color: context.appTheme.primaryColor),
      child: InkWell(
        onTap: () {
          setState(() {
            value += 1;
            widget.onChanged?.call(value);
          });
        },
        child: Icon(Icons.add, color: context.colorScheme.onPrimary),
      ),
    );
  }

  Widget _buildShowValue(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: context.appTheme.scaffoldBackgroundColor,
      child: Text('$value',
        style: context.textTheme.headline6,
      ),
    );
  }
}
