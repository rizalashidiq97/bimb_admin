class FormValidationErrorException<T> implements Exception {
  final T message;

  FormValidationErrorException(this.message);

  @override
  String toString() {
    return '$message';
  }
}
