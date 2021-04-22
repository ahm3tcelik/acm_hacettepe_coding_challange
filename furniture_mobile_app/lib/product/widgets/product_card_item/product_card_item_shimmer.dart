import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/custom_colors.dart';

class ProductCardItemShimmer extends StatelessWidget {
  const ProductCardItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildThumbnail(context),
            ),
            SizedBox(height: context.normalValue),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductName(context),
                  _buildProductPrice(context),
                  _buildStarRate(context),
                  _buildBuyButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColors.shimmer_1,
      highlightColor: CustomColors.shimmer_2,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: context.normalBorderRadius,
            color: context.appTheme.backgroundColor),
        child: SizedBox.expand(),
      ),
    );
  }

  Widget _buildProductName(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColors.shimmer_1,
      highlightColor: CustomColors.shimmer_2,
      child: Container(
        color: Colors.black,
        width: context.dynamicWidth(0.3),
        height: 15,
      ),
    );
  }

  Widget _buildProductPrice(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColors.shimmer_1,
      highlightColor: CustomColors.shimmer_2,
      child: Container(
        color: Colors.black,
        width: context.dynamicWidth(0.2),
        height: 10,
      ),
    );
  }

  Widget _buildStarRate(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColors.shimmer_1,
      highlightColor: CustomColors.shimmer_2,
      child: Container(
        color: Colors.black,
        width: context.dynamicWidth(0.1),
        height: 10,
      ),
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColors.shimmer_1,
      highlightColor: CustomColors.shimmer_2,
      child: Container(
          width: double.infinity,
          color: Colors.black,
          height: context.dynamicWidth(0.07),
      ),
    );
  }
}
