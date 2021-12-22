import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/settings/settings_screen.dart';

import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class HomeNewsScreen extends StatelessWidget {
  const HomeNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
          drawer: const SettingsScreen(),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavbarIndex(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
