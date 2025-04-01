class ProductException implements Exception {
  const ProductException({
    this.statusMessage,
    this.statusCode,
  });

  final String? statusMessage;
  final int? statusCode;
}
