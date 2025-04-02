import 'package:collecto_data/collecto_data.dart';

extension DioExceptionHelper on DioException {
  String get userFriendlyMessage => switch (type) {
        DioExceptionType.connectionTimeout => 'Connection timeout reached',
        DioExceptionType.sendTimeout => 'Send timeout reached',
        DioExceptionType.receiveTimeout => 'Receive timeout reached',
        DioExceptionType.badCertificate => 'Invalid certificate',
        DioExceptionType.badResponse => 'Bad response',
        DioExceptionType.cancel => 'Request canceled',
        DioExceptionType.connectionError =>
          'Please check your internet connection and retry',
        DioExceptionType.unknown => 'Unknown error',
      };
}
