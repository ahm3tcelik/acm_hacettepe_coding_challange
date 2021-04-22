import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NumberCounterButton extends StatelessWidget {

  final int value;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final double? width;
  final double? height;

  const NumberCounterButton({
    Key? key,
    required this.value,
    this.onIncrease,
    this.onDecrease,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30,
      width: width ?? 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: context.lowRadius,
                  bottomLeft: context.lowRadius,
                ),
                color: Colors.grey
              ),
              child: InkWell(
                onTap: onIncrease,
                child: Icon(Icons.remove, color: context.colorScheme.onPrimary),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              color: context.appTheme.scaffoldBackgroundColor,
              child: Text('$value', style: context.textTheme.headline6,),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: context.lowRadius,
                    bottomRight: context.lowRadius,
                  ),
                  color: context.appTheme.primaryColor
              ),
              child: InkWell(
                onTap: onDecrease,
                child: Icon(Icons.add, color: context.colorScheme.onPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
