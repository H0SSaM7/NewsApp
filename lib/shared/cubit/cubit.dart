import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(NewsInitialStates());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  bool isDark = false;

  changeTheme() {
    isDark = !isDark;
    CachedHelper.savePref(key: 'isDark', value: isDark)
        .then((value) => emit(NewsChangeThemeState()));
  }

  getTheme() {
    isDark = CachedHelper.getPref(key: 'isDark') ?? false;
    emit(NewsGetThemeState());
  }

  News news = News();
  int currentIndex = 0;
  List<TabItem> items = const [
    TabItem(icon: Icons.stacked_bar_chart, title: 'Business'),
    TabItem(icon: Icons.science_outlined, title: 'Science'),
    TabItem(icon: Icons.sports_esports_outlined, title: 'Sports'),
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

  changeRadioValue(String value) {
    CachedHelper.savePref(key: 'countryKey', value: value);
    countryKey = value;
    getBusinessData();
    getSportsData();
    getScienceData();
  }

  List<News> business = [];
  List<News> sports = [];
  List<News> science = [];
  List<News> search = [];
  var countryKey = CachedHelper.getPref(key: 'countryKey') ?? 'eg';

  getBusinessData() {
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': countryKey,
      'category': 'business',
      'apiKey': '2d229d8ac5254240bd2531ec179d123a',
    }).then((value) {
      business = [];
      List data;
      data = value.data!['articles'];
      for (var article in data) {
        if (value.statusCode == 200) {
          business.add(news.fromJson(article));
        } else {
          throw ('states code error');
        }
      }
      emit(NewsGettingBusinessData());
    }).catchError((onError) {
      emit(NewsErrorGettingBusinessData());
      debugPrint(onError.toString() + '(error in getting business data)');
    });
  }

  getScienceData() {
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': countryKey,
      'category': 'science',
      'apiKey': '2d229d8ac5254240bd2531ec179d123a',
    }).then((value) {
      science = [];
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
      emit(NewsErrorGettingScienceData());
      debugPrint(onError.toString() + '(error in getting business data)');
    });
  }

  getSportsData() {
    DioHelper.getData(path: 'v2/top-headlines', quires: {
      'country': countryKey,
      'category': 'sports',
      'apiKey': '2d229d8ac5254240bd2531ec179d123a',
    }).then((value) {
      sports = [];
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
      emit(NewsErrorGettingSportsData());
      debugPrint(onError.toString() + '(error in getting business data)');
    });
  }

  getSearchData({required String value}) {
    search = [];
    DioHelper.getData(path: 'v2/everything', quires: {
      'q': value,
      'apiKey': '2d229d8ac5254240bd2531ec179d123a',
    }).then((value) {
      List data;
      data = value.data!['articles'];
      for (var article in data) {
        if (value.statusCode == 200) {
          search.add(news.fromJson(article));
        } else {
          throw ('states code error');
        }
      }
      emit(NewsGettingSearchData());
    }).catchError((onError) {
      emit(NewsErrorGettingSearchData());
      debugPrint(onError.toString() + '(error in getting business data)');
    });
  }
}
