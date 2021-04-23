import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'category_model.g.dart';

@JsonSerializable()
class Category extends INetworkModel<Category> {
  final int? categoryId;
  final String? categoryName;

  Category({this.categoryId, this.categoryName});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  Category fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

final categories = <Category>[
  Category(categoryId: 1, categoryName: 'Chair'),
  Category(categoryId: 2, categoryName: 'Sofa'),
  Category(categoryId: 3, categoryName: 'Table'),
  Category(categoryId: 4, categoryName: 'Lamp'),
  Category(categoryId: 5, categoryName: 'Furniture'),
];
