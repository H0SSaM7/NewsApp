import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List articles = AppCubit.get(context).business;
          if (AppCubit.get(context).business.isEmpty) {
            return shimmerSkeleton();
          } else {
            return shimmerSkeleton();

            return buildListViewArticles(articles);
          }
        });
  }
}
