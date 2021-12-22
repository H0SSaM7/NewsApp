import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List articles = AppCubit.get(context).science;
          if (AppCubit.get(context).science.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return buildListViewArticles(articles);
          }
        });
  }
}