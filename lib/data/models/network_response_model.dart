class NetworkResponseModel<T> {
  final T? result;
  final String? errorMessage;
  final bool isError;

  NetworkResponseModel({
    this.result,
    this.errorMessage,
    this.isError = false,
  });
}