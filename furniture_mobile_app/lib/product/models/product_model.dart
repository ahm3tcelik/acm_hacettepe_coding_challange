import 'package:json_annotation/json_annotation.dart';

import '../../core/base/base_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product extends BaseModel<Product> {
  final int? productId;
  final int? categoryId;
  final String? productName;
  final String? description;
  final double? price;
  final double? stockQuantity;
  final double? starRate;
  final String? photoUrl;
  final List<String>? colors;

  Product({
    required this.productId,
    required this.categoryId,
    required this.productName,
    this.description,
    required this.price,
    required this.stockQuantity,
    required this.starRate,
    this.photoUrl,
    this.colors,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

final products = <Product>[
  Product(
      productId: 1,
      categoryId: 1,
      productName: 'Black Chair',
      price: 201,
      stockQuantity: 10,
      starRate: 4.5,
      colors: ['#397297', '#584F84', '#876A96', '#2D2D31'],
      description: '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl: 'https://freepikpsd.com/wp-content/uploads/2019/10/designer-chair-png-4-Transparent-Images.png'
  ),
  Product(
      productId: 2,
      categoryId: 1,
      productName: 'Blue Yutte',
      price: 150,
      stockQuantity: 15,
      starRate: 4.1,
      colors: ['#397297', '#584F84', '#876A96', '#2D2D31'],
      description: '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl: 'https://freepikpsd.com/wp-content/uploads/2019/10/designer-chair-png-4-Transparent-Images.png'
  ),
  Product(
      productId: 3,
      categoryId: 1,
      productName: 'Orange Cent',
      price: 175,
      starRate: 3.0,
      stockQuantity: 5,
      colors: ['#397297', '#584F84', '#876A96', '#2D2D31'],
      description: '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl: 'https://freepikpsd.com/wp-content/uploads/2019/10/designer-chair-png-4-Transparent-Images.png'
  ),
  Product(
      productId: 4,
      categoryId: 1,
      productName: 'Clovidennt',
      price: 90,
      starRate: 2.5,
      stockQuantity: 20,
      colors: ['#397297', '#584F84', '#876A96', '#2D2D31'],
      description: '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl: 'https://freepikpsd.com/wp-content/uploads/2019/10/designer-chair-png-4-Transparent-Images.png'
  ),
];
