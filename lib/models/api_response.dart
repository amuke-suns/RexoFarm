enum ResponseStatus {
  completed,
  completedWithData,
  error,
  invalidEmailOrPassword,
  existingEmail,
  notYetVerified,
}

class ApiResponse<T> {
  ResponseStatus status;
  T? data;
  String? token;
  String? message;

  ApiResponse.completed({required this.token})
      : status = ResponseStatus.completed;

  ApiResponse.completedWithData({required this.data})
      : status = ResponseStatus.completedWithData;

  ApiResponse.error(this.message) : status = ResponseStatus.error;

  ApiResponse.invalidPassword(this.message)
      : status = ResponseStatus.invalidEmailOrPassword;

  ApiResponse.notYetVerified(this.message)
      : status = ResponseStatus.notYetVerified;

  ApiResponse.existingEmail(this.message)
      : status = ResponseStatus.existingEmail;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Token : $token";
  }
}
