import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/view/search/search_screen.dart';
import 'package:news_app/view/settings/settings_screen.dart';

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
            iconTheme: const IconThemeData(
              color: Colors.deepOrange,
            ),
            title: const Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.deepOrange,
                ),
              )
            ],
          ),
          drawer: const SettingsScreen(),
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.reactCircle,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            activeColor: Colors.deepOrange,
            color: Colors.grey,
            initialActiveIndex: cubit.currentIndex,
            items: cubit.items,
            onTap: (index) {
              cubit.changeNavbarIndex(index);
            },
          ),
          // BottomNavigationBar(
          //   items: cubit.items,
          //   currentIndex: cubit.currentIndex,
          //   onTap: (index) {
          //     cubit.changeNavbarIndex(index);
          //   },
          // ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
