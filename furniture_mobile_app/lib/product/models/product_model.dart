import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product extends INetworkModel<Product> {
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
    this.productId,
    this.categoryId,
    this.productName,
    this.description,
    this.price,
    this.stockQuantity,
    this.starRate,
    this.photoUrl,
    this.colors,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  Product fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

final products = <Product>[
  Product(
      productId: 1,
      categoryId: 1,
      productName: 'Black Chair',
      price: 201,
      stockQuantity: 10,
      starRate: 4.5,
      colors: ['#397297', '#876A96', '#584F84', '#2D2D31'],
      description:
          '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl:
          'https://freepikpsd.com/wp-content/uploads/2019/10/designer-chair-png-4-Transparent-Images.png'),
  Product(
      productId: 2,
      categoryId: 1,
      productName: 'Blue Yutte',
      price: 150,
      stockQuantity: 15,
      starRate: 4.1,
      colors: ['#397297', '#584F84', '#876A96', '#2D2D31'],
      description:
          '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl:
          'https://pngimage.net/wp-content/uploads/2018/05/designer-chair-png-1.png'),
  Product(
      productId: 3,
      categoryId: 1,
      productName: 'Orange Cent',
      price: 175,
      starRate: 3.0,
      stockQuantity: 5,
      colors: ['#397297', '#584F84', '#876A96', '#2D2D31'],
      description:
          '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl:
          'https://i.pinimg.com/originals/8a/9b/45/8a9b4587751f57e4e9ceb6c4c515d339.png'),
  Product(
      productId: 4,
      categoryId: 1,
      productName: 'Clovidennt',
      price: 90,
      starRate: 2.5,
      stockQuantity: 20,
      colors: ['#397297', '#584F84', '#876A96', '#2D2D31'],
      description:
          '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl:
          'https://www.pngkit.com/png/full/957-9577843_eames-plastic-side-chair-dsw-by-vitra-side.png'),
  Product(
      productId: 5,
      categoryId: 2,
      productName: 'Sofaroyal',
      price: 300,
      starRate: 4.5,
      stockQuantity: 25,
      colors: ['#42f5b0', '#584F84', '#876A96', '#2D2D31'],
      description:
          '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl:
          'https://i.pinimg.com/736x/37/2e/2c/372e2c2023ab084a82b91749170de2eb.jpg'),
  Product(
      productId: 6,
      categoryId: 2,
      productName: 'Modern',
      price: 255,
      starRate: 4.1,
      stockQuantity: 25,
      colors: ['#42f5b0', '#584F84', '#876A96', '#2D2D31'],
      description:
          '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl: 'https://freepngimg.com/thumb/categories/2415.png'),
  Product(
      productId: 7,
      categoryId: 3,
      productName: 'Modern Table',
      price: 30,
      starRate: 2.1,
      stockQuantity: 20,
      colors: ['#42f5b0', '#333835', '#404241', '#2D2D31'],
      description:
          '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl:
          'https://www.pngkey.com/png/full/103-1036569_table-transparent-modern-modern-table-png.png'),
  Product(
      productId: 8,
      categoryId: 4,
      productName: 'X Lamp',
      price: 30,
      starRate: 2.4,
      stockQuantity: 20,
      colors: ['#f5ef42', '#333835', '#404241', '#2D2D31'],
      description:
          '''Nullam tristique eu leo non auctor. Mauris ultricies in eros sed dictum. Integer interdum mauris tortor, vel euismod ligula imperdiet ut. Cras id porttitor libero. Proin et semper mi, et gravida nunc. Vivamus mattis sem sit amet nisi dignissim lacinia. Cras sapien metus, cursus quis leo non, blandit faucibus justo. Aliquam sodales venenatis sem a aliquam.''',
      photoUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/001/201/606/small_2x/lamp.png'),
];
