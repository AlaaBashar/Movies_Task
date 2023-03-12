class ApiResponse<T> {
  /// [data] used to contain data that returned from API.
  /// It is have a generic type for some reasons:
  /// - casting to any Model [SubjectModel], [StudentDataModel], etc..
  late dynamic data;

  /// [statusCode] used to contain the returned Status Code from API.
  late int? statusCode;

  /// [message] used to return the error messages from the API or Exceptions.
  late String? message;

  ApiResponse({this.data, this.statusCode, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      statusCode: json["statusCode"],
      message: json["message"],
      data: create(json["data"]),
    );
  }
}
