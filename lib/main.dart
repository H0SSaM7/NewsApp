import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/home/home_screen.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/theme/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CachedHelper.init();
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
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBusinessData()
        ..getScienceData()
        ..getSportsData()
        ..getTheme(),
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
