import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://magdsoft-internship.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
        headers:
        {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    String lang = 'en',
  }) async
  {
    dio!.options.headers =
    {
      'lang':lang,
      'Authorization':token
    };

    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}