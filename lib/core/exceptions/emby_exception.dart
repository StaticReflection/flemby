class EmbyException implements Exception {
  final String message;
  final int statusCode;

  EmbyException(this.message, {required this.statusCode});

  @override
  String toString() => message;
}

class UnauthorizedException extends EmbyException {
  UnauthorizedException(super.message) : super(statusCode: 401);
}
