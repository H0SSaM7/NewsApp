import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/data/repository/get_news_repo.dart';
import 'package:news_app/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsRepo news;
  final String countryKey = 'us';
  NewsBloc({required this.news}) : super(NewsInitial()) {
    on<NewsEvent>(
      (event, emit) async {
// getting business data ------------------------
        List<NewsModel>? business =
            await news.getNews(countryKey, categoryType.business);
        if (business == null) {
          emit(const BusinessNewsErrorState(
              'Something went wrong on getting Business News'));
        } else {
          emit(BusinessNewsSuccessState(business));
        }
// getting science data ------------------------
        List<NewsModel>? science =
            await news.getNews(countryKey, categoryType.science);
        if (science == null) {
          emit(const BusinessNewsErrorState(
              'Something went wrong on getting science News'));
        } else {
          emit(BusinessNewsSuccessState(science));
        }

// getting sport data ------------------------
        List<NewsModel>? sport =
            await news.getNews(countryKey, categoryType.sport);
        if (sport == null) {
          emit(const BusinessNewsErrorState(
              'Something went wrong on getting sport News'));
        } else {
          emit(SportNewsSuccessState(sport));
        }
      },
    );
  }
}
