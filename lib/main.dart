import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/home/home_screen.dart';
import 'package:news_app/services/remote/dio_helper.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
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
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBusinessData()
        ..getScienceData()
        ..getSportsData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            color: Colors.blueGrey,
            title: 'News App',
            debugShowCheckedModeBanner: false,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            theme: ThemesHelper.lightTheme,
            darkTheme: ThemesHelper.darkTheme,
            home: const HomeNewsScreen(),
          );
        },
      ),
    );
  }
}
