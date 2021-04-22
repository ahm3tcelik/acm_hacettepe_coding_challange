// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    productId: json['productId'] as int?,
    categoryId: json['categoryId'] as int?,
    productName: json['productName'] as String?,
    description: json['description'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    starRate: (json['starRate'] as num?)?.toDouble(),
    photoUrl: json['photoUrl'] as String?,
    colors:
        (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'categoryId': instance.categoryId,
      'productName': instance.productName,
      'description': instance.description,
      'price': instance.price,
      'starRate': instance.starRate,
      'photoUrl': instance.photoUrl,
      'colors': instance.colors,
    };
