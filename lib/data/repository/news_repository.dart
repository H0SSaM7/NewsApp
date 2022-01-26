import 'package:news_app/models/news_model.dart';

abstract class NewsRepository {
  Future<List<NewsModel>> getNews(String countryKey);
}
