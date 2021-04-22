import 'package:json_annotation/json_annotation.dart';
import '../../core/base/base_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class Category extends BaseModel<Category> {
  final int? categoryId;
  final String? categoryName;

  Category({required this.categoryId, required this.categoryName});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

final categories = <Category>[
  Category(categoryId: 1, categoryName: 'Chair'),
  Category(categoryId: 2, categoryName: 'Sofa'),
  Category(categoryId: 3, categoryName: 'Table'),
  Category(categoryId: 4, categoryName: 'Lamp'),
  Category(categoryId: 5, categoryName: 'Furniture'),
];
