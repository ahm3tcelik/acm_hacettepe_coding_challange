///
/// Usually the [LEFT] is the error case, the [RIGHT] is the successful case
///
abstract class Either<L, R> {
  final L? left;
  final R? right;

  const Either({this.left, this.right});

  bool get isLeft => left != null;
  bool get isRight => right != null;

  /// ```dart
  /// result = Right<String, int>(200);
  ///
  /// result.fold(onLeft: (failure) {
  ///
  ///   print('ERROR CASE');
  ///
  /// }, onRight: (data) {
  ///
  ///   print('SUCCESS CASE $data');
  ///
  /// });
  ///
  /// // The results of code: 'SUCCESS CASE 200'
  /// ```
  void fold({required Function(L? l) onLeft, required Function(R? r) onRight}) {
    if (!isRight) {
      onLeft(left);
    }
    else {
      onRight(right);
    }
  }
}

class Right<L, R> extends Either<L, R> {
  const Right(right): super(right: right);
}

class Left<L, R> extends Either<L, R> {
  const Left(left) : super(left: left);
}