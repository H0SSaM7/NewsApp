import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class SportsNewsApi extends NewsRepository {
  @override
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
      print(err.toString());
    }
    return sportsList;
  }
}
