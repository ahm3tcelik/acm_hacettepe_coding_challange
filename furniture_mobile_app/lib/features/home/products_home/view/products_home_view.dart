import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/widgets/ternary_widget.dart';
import '../../../../product/models/category_model.dart';
import '../../../../product/widgets/category_chip_item.dart';
import '../../../../product/managers/user_manager.dart';
import '../../../../product/models/product_model.dart';
import '../../../../product/widgets/product_card_item/product_card_item.dart';
import '../../../../product/widgets/product_card_item/product_card_item_shimmer.dart';
import '../../product_detail/view/product_detail_view.dart';
import '../viewmodel/products_home_viewmodel.dart';

class HomeView extends StatelessWidget {
  final _viewModel = ProductsHomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductsHomeViewModel>(
      viewModel: _viewModel,
      onContextReady: (context) => _viewModel.context = context,
      onModelReady: (model) => model.onInit(),
      onDispose: () => _viewModel.onDispose(),
      onPageBuilder: (context, value) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: context.horizontalPaddingNormal,
            child: Column(
              children: [
                _buildTopBar(context),
                SizedBox(height: context.normalValue),
                _buildFilters(context),
                SizedBox(height: context.normalValue),
                _buildCategories(context),
                SizedBox(height: context.normalValue),
                Expanded(child: _buildProductsObserver(context)),
                SizedBox(height: context.normalValue),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipOval(
        child: CachedNetworkImage(
          imageUrl: context.watch<UserManager>().currentUser?.photoUrl ?? '',
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      title: Text(
        'Welcome',
        style: context.textTheme.bodyText2,
      ),
      subtitle: Text(
        context.watch<UserManager>().currentUser?.fullName ?? '',
        style:
            context.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(CupertinoIcons.bell),
    );
  }

  Widget _buildFilters(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildSearchBox(context)),
        SizedBox(width: context.mediumValue),
        _buildFilterButton(context)
      ],
    );
  }

  Widget _buildSearchBox(BuildContext context) {
    return TextField(
      onSubmitted: (value) => _viewModel.onSubmitSearch(value),
      controller: _viewModel.searchTextController,
      decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          suffixIcon: IconButton(
            icon: Icon(CupertinoIcons.clear),
            onPressed: _viewModel.clearSearchText,
          ),
          hintText: LocaleKeys.search_hint.tr(),
          isDense: true,
          filled: true,
          fillColor: context.appTheme.cardColor,
          border: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none, width: 0),
              borderRadius: context.lowBorderRadius)),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        color: context.appTheme.cardColor,
      ),
      child: IconButton(
        icon: Icon(Icons.settings_outlined),
        onPressed: () {},
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Observer(
      builder: (_) => SizedBox(
        height: context.dynamicHeight(0.07),
        child: Ternary(
          condition: _viewModel.categoryViewState == ViewState.BUSY,
          widgetTrue: Stack(
              alignment: Alignment.center,
              children: [LinearProgressIndicator()]),
          widgetFalse: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _viewModel.categoryList.length,
            itemBuilder: (context, index) =>
                _buildCategoryCard(context, _viewModel.categoryList[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Category category) {
    return Observer(
      builder: (_) => CategoryChipItem(
        category: category,
        isSelected: _viewModel.isCategorySelected(category.categoryId),
        onSelected: () => _viewModel.changeCategoryId(category.categoryId),
      ),
    );
  }

  Widget _buildProductsObserver(BuildContext context) {
    return Observer(
      builder: (_) => Ternary(
        condition: _viewModel.productViewState == ViewState.DATA,
        widgetTrue: _buildProductsGrid(context),
        widgetFalse: _buildProductShimmerGrid(context),
      ),
    );
  }

  Widget _buildProductsGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 3),
      itemCount: _viewModel.filteredProductList.length,
      itemBuilder: (context, index) =>
          _buildProductCard(context, _viewModel.filteredProductList[index]),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return Consumer<UserManager>(
      builder: (context, userManager, child) => ProductCardItem(
        isFav: _viewModel.isFavorite(userManager, product),
        onChangeFav: (isChecked) => _viewModel.setFav(product, isChecked),
        product: product,
        onClickBuy: () => goToDetailPage(context, product),
        onClickDetail: () => goToDetailPage(context, product),
      ),
    );
  }

  Widget _buildProductShimmerGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 3),
      itemCount: 4,
      itemBuilder: (context, index) => ProductCardItemShimmer(),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: context.normalRadius,
        topRight: context.normalRadius,
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: LocaleKeys.home.tr(),
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: LocaleKeys.basket.tr(),
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: LocaleKeys.star.tr(),
            icon: Icon(CupertinoIcons.star),
          ),
          BottomNavigationBarItem(
            label: LocaleKeys.profile.tr(),
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }

  void goToDetailPage(BuildContext context, Product product) {
    Navigator.push(context,
      PageTransition(
        type: PageTransitionType.fade,
        child: ProductDetailView(product: product),
      ),
    );
  }
}
