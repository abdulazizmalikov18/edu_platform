class ServerException implements Exception {
  final String errorMessage;
  final num statusCode;

  const ServerException({required this.statusCode, required this.errorMessage});

  @override
  String toString() =>
      'ServerException(statusCode: $statusCode, errorMessage: $errorMessage)';
}

class DioExceptions implements Exception {}

class ParsingException implements Exception {
  final String errorMessage;

  const ParsingException({required this.errorMessage});
}

class CacheException implements Exception {
  final String errorMessage;

  const CacheException({required this.errorMessage});
}
