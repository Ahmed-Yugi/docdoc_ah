import 'package:dio/dio.dart';

class ResponseHelper {

  static T handleResponse<T>({
    required Response response,
    required T Function(dynamic json) fromJson,
  }) {

    if (response.statusCode == 200 || response.statusCode == 201) {
      return fromJson(response.data);
    } else {
      throw Exception(
        "Request failed with status code: ${response.statusCode}",
      );
    }
  }
}