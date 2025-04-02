import 'package:collecto_data/collecto_data.dart';

class ProductException extends CollectoException {
  const ProductException({
    super.statusMessage,
    super.statusCode,
  });
}
