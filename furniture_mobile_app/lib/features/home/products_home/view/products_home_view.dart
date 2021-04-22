import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/widgets/ternary_widget.dart';
import '../../../../product/models/category_model.dart';
import '../../../../product/widgets/category_chip_item.dart';
import '../../../../product/widgets/product_card_item/product_card_item.dart';
import '../../../../product/widgets/product_card_item/product_card_item_shimmer.dart';
import '../../product_detail/view/product_detail_view.dart';
import '../viewmodel/products_home_viewmodel.dart';

class HomeView extends StatelessWidget {
  final _viewModel = ProductsHomeViewModel();

  @override
  Widget build(BuildContext context) {

    _viewModel.onInit();
    return BaseView<ProductsHomeViewModel>(
      viewModel: _viewModel,
      onModelReady: (model) => model.onInit(),
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
      leading: CircleAvatar(),
      title: Text(
        'Welcome',
        style: context.textTheme.bodyText2,
      ),
      subtitle: Text(
        'Courtney Henry',
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
      decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: 'Search...',
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
      builder: (_) => Ternary(
        condition: _viewModel.categoryViewState == ViewState.BUSY,
        widgetTrue: LinearProgressIndicator(),
        widgetFalse: SizedBox(
          height: context.dynamicHeight(0.07),
          child: ListView.builder(
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
      itemCount: _viewModel.productList.length,
      itemBuilder: (context, index) => ProductCardItem(
        product: _viewModel.productList[index],
        onClickDetail: () => Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: ProductDetailView(product: _viewModel.productList[index]),
          ),
        ),
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
            label: 'Home',
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Basket',
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Star',
            icon: Icon(CupertinoIcons.star),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
