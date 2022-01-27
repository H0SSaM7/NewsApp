import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/cubit.dart';
import 'package:news_app/controllers/news_bloc/news_bloc.dart';
import 'package:news_app/controllers/states.dart';
import 'package:news_app/data/data_source/local/shared_pref_helper.dart';
import 'package:news_app/data/data_source/remote/dio_helper.dart';
import 'package:news_app/data/repository/get_news_repo.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/utill/bloc_observer.dart';
import 'package:news_app/utill/theme/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await SharedPrefHelper.init();
      // bool? storageTheme= CacheHelper.getData(key: 'isDark');
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getBusinessData()
            ..getScienceData()
            ..getSportsData()
            ..getTheme(),
        ),
        BlocProvider(
            create: (context) =>
                NewsBloc(news: GetNewsRepo())..add(NewsEvent())),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            color: Colors.blueGrey,
            title: 'News App',
            debugShowCheckedModeBanner: false,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemesHelper.lightTheme,
            darkTheme: ThemesHelper.darkTheme,
            home: const Directionality(
                textDirection: TextDirection.ltr, child: HomeNewsScreen()),
          );
        },
      ),
    );
  }
}
