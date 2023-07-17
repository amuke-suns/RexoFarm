enum ResponseStatus {
  completed,
  error,
  invalidEmailOrPassword,
  existingEmail,
  notYetVerified,
}

class ApiResponse<T> {
  ResponseStatus status;
  T? data;
  String? message;

  ApiResponse.completed(this.data) : status = ResponseStatus.completed;

  ApiResponse.error(this.message) : status = ResponseStatus.error;

  ApiResponse.invalidPassword(this.message)
      : status = ResponseStatus.invalidEmailOrPassword;

  ApiResponse.notYetVerified(this.message) : status = ResponseStatus.notYetVerified;

  ApiResponse.existingEmail(this.message) : status = ResponseStatus.existingEmail;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
