import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Container(
            color: const Color(0xff22345d),
            width: 220,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text('News App', style: Theme.of(context).textTheme.headline1),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DarkTheme',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Switch.adaptive(
                      value: AppCubit.get(context).isDarkTheme,
                      onChanged: (index) {
                        AppCubit.get(context).changeToDarkTheme(index);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
