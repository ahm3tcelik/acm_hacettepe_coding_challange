import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../models/category_model.dart';

class CategoryChipItem extends StatelessWidget {
  final bool isSelected;
  final Category category;
  final VoidCallback? onSelected;

  const CategoryChipItem({
    Key? key,
    required this.category,
    required this.isSelected,
    this.onSelected}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.horizontalPaddingLow,
      child: FilterChip(
        label: Text(category.categoryName ?? ''),
        onSelected: (value) {
          if (onSelected != null) {
            onSelected!();
          }
        },
        selected: isSelected,
        showCheckmark: false,
        labelStyle: context.appTheme.chipTheme.labelStyle.copyWith(
            color: isSelected
                ? context.colorScheme.onPrimary
                : context.colorScheme.onBackground),
      ),
    );
  }
}
