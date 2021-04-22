import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/wrap_with_badge.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/init/theme/furniture_theme.dart';
import '../../../../product/managers/basket_manager.dart';
import '../../../../product/constants/custom_colors.dart';
import '../../../../product/extensions/string_extensions.dart';
import '../../../../product/models/product_model.dart';
import '../../../../product/widgets/number_counter_button.dart';
import '../../../../product/widgets/product_fav_button.dart';
import '../viewmodel/product_detail_viewmodel.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  ProductDetailView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final _viewModel = ProductDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailViewModel>(
      viewModel: _viewModel,
      onContextReady: (context) => _viewModel.context = context,
      onPageBuilder: (context, value) => Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(child: _buildBody(context)),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.navigation.pop(),
        icon: Icon(CupertinoIcons.back),
      ),
      title: Text('Detail Product'),
      actions: [_buildFavButton(context)],
      elevation: 0,
      backgroundColor: context.appTheme.scaffoldBackgroundColor,
    );
  }

  Widget _buildFavButton(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Hero(
          tag: product.productName.productFavTag,
          child: ProductFavButton(isFav: true)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SizedBox(
        height: context.height,
        child: Stack(
          children: [
            _buildProductContainer(context),
            _buildProductImage(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      alignment: Alignment.center,
      height: context.dynamicHeight(0.25),
      child: Hero(
          tag: product.productName.productPhotoTag,
          child: Image.network(product.photoUrl ?? '')),
    );
  }

  Widget _buildProductContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: context.paddingMedium,
      margin: EdgeInsets.only(top: context.dynamicHeight(0.25)),
      decoration: BoxDecoration(
        color: context.appTheme.cardColor,
        borderRadius: BorderRadius.only(
            topLeft: context.normalRadius * 1.5,
            topRight: context.normalRadius * 1.5),
      ),
      child: _buildProductContent(context),
    );
  }

  Widget _buildProductContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildProductTitle(context),
        SizedBox(height: context.normalValue),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStarRate(context),
            const Expanded(child: SizedBox()),
            _buildQuantityButton(context)
          ],
        ),
        SizedBox(height: context.normalValue),
        _buildProductColors(context),
        SizedBox(height: context.normalValue),
        _buildDescription(context),
        SizedBox(height: context.normalValue),
        _buildPrice(context),
        SizedBox(height: context.normalValue),
        Row(
          children: [
            _buildBasketButton(context),
            SizedBox(width: context.normalValue),
            Expanded(child: _buildBuyButton(context))
          ],
        )
      ],
    );
  }

  Widget _buildProductTitle(BuildContext context) {
    return Text(product.productName ?? '',
        style:
            context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold));
  }

  Widget _buildStarRate(BuildContext context) {
    return Chip(
      label: Text(product.starRate?.toStringAsFixed(1) ?? '-.-'),
      avatar: Icon(
        CupertinoIcons.star_fill,
        color: CustomColors.brightSun,
        size: 16,
      ),
      shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
      backgroundColor: context.appTheme.primaryColor,
    );
  }

  Widget _buildProductColors(BuildContext context) {
    return Row(
      children: [
        Text(
          'Color',
          style: context.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: context.normalValue),
        Expanded(
          child: Wrap(
            children: [
              for (String? color in product.colors ?? [])
                Container(
                  width: context.dynamicHeight(0.04),
                  height: context.dynamicHeight(0.04),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.hexToColor,
                  ),
                  margin: context.horizontalPaddingLow,
                )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(product.description ?? '', style: context.textTheme.bodyText2);
  }

  Widget _buildPrice(BuildContext context) {
    return Text(
      '\$${product.price?.toStringAsFixed(2) ?? '-.--'}',
      style: textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBasketButton(BuildContext context) {
    return Card(
      elevation: 1,
      shape: CircleBorder(),
      color: context.appTheme.scaffoldBackgroundColor,
      child: InkWell(
        onTap: () {},
        customBorder: CircleBorder(),
        child: _buildBasketButtonContent(context),
      ),
    );
  }

  Widget _buildBasketButtonContent(BuildContext context) {
    return Container(
        height: context.dynamicHeight(0.07),
        width: context.dynamicHeight(0.07),
        child: WrapWithBadge(
          bottom: 0,
          right: 0,
          badgeLabel: context.watch<BasketManager>().productCount.toString(),
          badgeColor: context.appTheme.primaryColor,
          child: Icon(Icons.shopping_bag_outlined, size: context.dynamicHeight(0.05),),
        )
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.07),
      child: ElevatedButton(
        onPressed: () => _viewModel.buyProduct(product),
        child: Text('Buy',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onPrimary)),
      ),
    );
  }

  Widget _buildQuantityButton(BuildContext context) {
    return NumberCounterButton(
      height: context.dynamicHeight(0.05),
      width: context.dynamicWidth(0.3),
      onChanged: (value) => _viewModel.changeQuantity(value),
    );
  }
}
