import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/cubit.dart';
import 'package:news_app/controllers/states.dart';
import 'package:news_app/utill/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List articles = AppCubit.get(context).sports;
          if (AppCubit.get(context).sports.isEmpty) {
            return shimmerSkeleton();
          } else {
            return buildListViewArticles(articles);
          }
        });
  }
}
