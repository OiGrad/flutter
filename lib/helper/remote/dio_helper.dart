import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kemet/core/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        // baseUrl: 'http://ec2-100-25-70-197.compute-1.amazonaws.com/',
        baseUrl: 'http://192.168.1.5:8000/',
        //baseUrl: 'https://58e9-197-36-209-110.ngrok-free.app/',
        receiveDataWhenStatusError: true,

        /// If you want to handle the headers HERE"
        // headers: {
        //   'Content-Type': 'application/json',
        //   'lang': 'ar',
        // },
      ),
    );
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      lang,
      token,
      onreceivProgres = null}) async {
    dio.options.headers["Authorization"] = 'Bearer ${AppConstants.token}';
    if (onreceivProgres == null) {
      onreceivProgres = (int a, int b) {};
    }
    return await dio.get(url,
        queryParameters: query, onReceiveProgress: onreceivProgres);
  }

  static Future<Response> postData(
      {required url, query, required data, lang = 'en', token}) async {
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({required String url, required data}) async {
    return await dio.put(url, data: data);
  }

  static Future<Response> deleteData({required url, data}) async {
    return dio.delete(url, data: data);
  }
}
