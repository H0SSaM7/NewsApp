import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/services/remote/dio_helper.dart';
import 'package:news_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(NewsInitialStates());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  News news = News();
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.stacked_bar_chart), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_esports_outlined), label: 'Sports'),
  ];
  changeNavbarIndex(int index) {
    currentIndex = index;
    emit(NewsChangeNavBarStates());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];
  bool isDarkTheme = false;

  changeToDarkTheme(bool isDark) {
    isDarkTheme = isDark;
    emit(NewsChangeThemeStates());
  }

  List<News> business = [];
  List<News> sports = [];
  List<News> science = [];

  getBusinessData() {
    emit(NewsOnLoadingGettingBusinessData());
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '2d229d8ac5254240bd2531ec179d123a',
    }).then((value) {
      List data;
      data = value.data!['articles'];
      for (var article in data) {
        if (value.statusCode == 200) {
          business.add(news.fromJson(article));
        } else {
          throw ('states code error');
        }
      }
      print(business.length.toString());
      emit(NewsGettingBusinessData());
    }).catchError((onError) {
      emit(NewsOnLoadingGettingBusinessData());
      debugPrint(onError.toString() + '(error in getting business data)');
    });
  }

  getScienceData() {
    emit(NewsOnLoadingGettingScienceData());
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '2d229d8ac5254240bd2531ec179d123a',
    }).then((value) {
      List data;
      data = value.data!['articles'];
      for (var article in data) {
        if (value.statusCode == 200) {
          science.add(news.fromJson(article));
        } else {
          throw ('states code error');
        }
      }
      emit(NewsGettingScienceData());
    }).catchError((onError) {
      emit(NewsOnLoadingGettingScienceData());
      debugPrint(onError.toString() + '(error in getting business data)');
    });
  }

  getSportsData() {
    emit(NewsOnLoadingGettingSportsData());
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '2d229d8ac5254240bd2531ec179d123a',
    }).then((value) {
      List data;
      data = value.data!['articles'];
      for (var article in data) {
        if (value.statusCode == 200) {
          sports.add(news.fromJson(article));
        } else {
          throw ('states code error');
        }
      }
      emit(NewsGettingSportsData());
    }).catchError((onError) {
      emit(NewsOnLoadingGettingSportsData());
      debugPrint(onError.toString() + '(error in getting business data)');
    });
  }
}
