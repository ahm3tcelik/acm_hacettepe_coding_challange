extension NetworkImageExtension on String? {
  String get orDefault {
    var url = this;
    return url ?? 'https://i.pravatar.cc/150?img=18';
  }
}

extension StringExtension on String? {
  String get orEmpty {
    var val = this;
    return val ?? '';
  }
}