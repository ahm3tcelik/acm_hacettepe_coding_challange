import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../../constants/custom_colors.dart';
import '../../extensions/string_extensions.dart';
import '../../models/product_model.dart';
import '../product_fav_button.dart';

class ProductCardItem extends StatelessWidget {
  final bool? isFav;

  // Set shimmer to card if product null
  final Product product;
  final VoidCallback? onClickBuy;
  final VoidCallback? onClickDetail;

  const ProductCardItem({
    Key? key,
    required this.product,
    this.isFav,
    this.onClickBuy,
    this.onClickDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(child: _buildThumbnail(context)),
            SizedBox(height: context.lowValue),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProductName(context),
                  _buildProductPrice(context),
                  _buildStarRate(context),
                  _buildBuyButton(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        InkWell(
          onTap: onClickDetail ?? () {},
          child: Hero(
            tag: product.productName.productPhotoTag,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: context.normalBorderRadius,
                  color: context.appTheme.backgroundColor),
              child: Image.network(product.photoUrl ?? ''),
            ),
          ),
        ),
        Positioned(
          right: context.lowValue / 2,
          top: context.lowValue / 2,
          child: Hero(
              tag: product.productName.productFavTag,
              child: ProductFavButton(isFav: isFav ?? false)),
        )
      ],
    );
  }

  Widget _buildProductName(BuildContext context) {
    return Text(
      product.productName ?? '',
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProductPrice(BuildContext context) {
    return Text(
      '\$${product.price?.toStringAsFixed(2) ?? '-'}',
      style: context.textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w400),
    );
  }

  Widget _buildStarRate(BuildContext context) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.star_fill,
          color: CustomColors.brightSun,
          size: 13,
        ),
        SizedBox(width: context.lowValue),
        Text(
          product.starRate?.toStringAsFixed(1) ?? '-',
          style:
              context.textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: onClickBuy ?? () {},
      child: Text(LocaleKeys.widgets_product_card_item_buy.tr()),
    );
  }
}
