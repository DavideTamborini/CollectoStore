abstract class CollectoException implements Exception {
  const CollectoException({
    this.statusMessage,
    this.statusCode,
  });

  final String? statusMessage;
  final int? statusCode;
}
