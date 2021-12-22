import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/home_screen.dart';
import 'package:news_app/services/remote/dio_helper.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/theme/themes.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      DioHelper.init();
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemesHelper.lightTheme,
      darkTheme: ThemesHelper.darkTheme,
      home: const HomeNewsScreen(),
    );
  }
}
