import 'package:collecto_data/collecto_data.dart';

extension ApiErrorsHelper on CollectoException {
  String get userFriendlyMessage => switch (statusCode) {
        401 => 'Unauthorized access',
        403 => 'Access to this resource is prohibited',
        404 => 'The item you are looking for does not exist',
        500 => 'Internal server error',
        int() => 'There was a problem.. please try again',
        null => statusMessage ?? 'There was a problem.. please try again',
      };
}
