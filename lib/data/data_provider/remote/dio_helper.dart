import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart' show debugPrint;

class DioHelper {
  static Dio? dio;
  static init() {
    try {
      dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ));
      debugPrint('dio init successfully');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<Response<Map<String, dynamic>>> getData(
      {required String path, required Map<String, dynamic> quires}) async {
    return await dio!.get(path, queryParameters: quires);
  }
}
// 2d229d8ac5254240bd2531ec179d123a

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2d229d8ac5254240bd2531ec179d123a

//https://newsapi.org/v2/everything?q=tesla&from=2021-11-23&sortBy=publishedAt&apiKey=2d229d8ac5254240bd2531ec179d123a
