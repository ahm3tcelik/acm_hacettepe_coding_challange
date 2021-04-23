extension NetworkImageExtension on String? {
  String get orDefault {
    var url = this;
    return url ?? 'https://i.pravatar.cc/150?img=18';
  }
}

extension HeroTagExtension on String? {
  String get avatarTag {
    var tag = this;
    return '${tag ?? ''}@avatar';
  }
}

extension StringExtension on String? {
  String get orEmpty {
    var val = this;
    return val ?? '';
  }
}