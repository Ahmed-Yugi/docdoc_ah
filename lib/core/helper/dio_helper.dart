import 'package:dio/dio.dart';
import '../const/api_const.dart';
import 'cash_helper.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: APIConst.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  // GET DATA
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    final token = CacheHelper.getToken();
    return await dio.get(
      url,
      queryParameters: query,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }

  // POST DATA
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {

    final token = CacheHelper.getToken();

    return await dio.post(
      url,
      data: data,
      queryParameters: query,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }
}