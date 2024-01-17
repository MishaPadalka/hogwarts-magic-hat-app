class ResponseModel<T> {
  final T? result;
  final String? errorMessage;
  final bool isError;

  ResponseModel({
    this.result,
    this.errorMessage,
    this.isError = false,
  });
}