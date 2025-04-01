enum ApiStatus {
  loading(null),
  success(null),
  failure(400),
  unauthorized(401),
  forbidden(403),
  serverError(500),
  ;

  const ApiStatus(this.code);

  final int? code;
}
