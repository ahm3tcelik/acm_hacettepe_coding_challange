import 'package:flutter/widgets.dart';

extension HeroTagExtension on String? {
  String get productFavTag {
    var tag = this;
    return '${tag ?? ''}@product_fav';
  }

  String get productPhotoTag {
    var tag = this;
    return '${tag ?? ''}@product_photo';
  }
}

extension ColorExtension on String? {
  Color get hexToColor {
    var hexColor = this;
    hexColor ??= '#FFFFFF';
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}