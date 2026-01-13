import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'end_points.dart';

class DioHelper {
  static Dio? dio;
  static initDio() {
    dio ??= Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        // baseUrl: AppEndPoints.baseUrl
      )
    );
    dio!.interceptors.add(PrettyDioLogger());
  }
  static Future<Response> getRequest({required String endPoint, String? param}) async {
    Response response;
    try {
      if (param != null) {
        response = await dio!.get(AppEndPoints.baseUrl + endPoint, queryParameters:
        {
          "title": param
        });
      }
      else {
        response = await dio!.get(AppEndPoints.baseUrl + endPoint);
      }
      return response;
    }
    catch(e) {
      rethrow;
    }
  }
  static Future<Response> postRequest({required String endPoint,
    Map<String, dynamic>? data}) async {
    try {
      Response response = await dio!.post(AppEndPoints.authBaseUrl + endPoint, data: data);
      return response;
    }
    catch(e) {
      rethrow;
    }
  }
}