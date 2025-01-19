class BaseException implements Exception {
  final String message;

  BaseException(this.message);

  @override
  String toString() {
    return message;
  }
}

class ServerException extends BaseException {
  ServerException(dynamic error)
      : super(error?.message ?? 'Unknown server error');
}

class APIResponseException extends BaseException {
  APIResponseException({String? message = "API Response exception"})
      : super(message!);
}

class NotFoundException extends BaseException {
  NotFoundException({String? message = "Not found!"}) : super(message!);
}

class BadRequestException extends BaseException {
  BadRequestException({String? message = "Bad Request!"}) : super(message!);
}

class UnauthorizedException extends BaseException {
  UnauthorizedException({String? message = "Unauthorized!"}) : super(message!);
}

class CacheException extends BaseException {
  CacheException(super.message);
}
