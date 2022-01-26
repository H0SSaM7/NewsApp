import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/data/data_source/remote/dio_helper.dart';
import 'package:news_app/models/news_model.dart';

class GetNewsRepo {
  Future<List<NewsModel>> getNews(String countryKey) async {
    NewsModel newsModel = NewsModel();
    List<NewsModel> sportsList = [];
    try {
      Response<Map<String, dynamic>> data = await DioHelper.getData(
        path: 'v2/top-headlines',
        quires: {
          'country': countryKey,
          'category': 'sports',
          'apiKey': '2d229d8ac5254240bd2531ec179d123a',
        },
      );
      if (data.statusCode == 200) {
        for (var element in data.data!['articles']) {
          sportsList.add(newsModel.fromJson(element));
        }
      }
    } catch (err) {
      debugPrint(err.toString());
    }
    return sportsList;
  }
}
