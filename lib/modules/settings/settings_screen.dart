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
        AppCubit _cubit = AppCubit.get(context);
        return SafeArea(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: 220,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text('News App', style: Theme.of(context).textTheme.headline1),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Change Theme',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Switch.adaptive(
                      value: _cubit.isDark,
                      activeColor: Colors.deepOrange,
                      onChanged: (index) {
                        _cubit.changeTheme();
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
