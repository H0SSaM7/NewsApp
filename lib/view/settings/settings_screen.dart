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
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.elliptical(20, 20),
                topEnd: Radius.elliptical(20, 20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'images/newspaper.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                Text('News App', style: Theme.of(context).textTheme.headline1),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.lightbulb_outline_rounded,
                      color: Colors.deepOrange),
                  title: const Text(
                    'Dark Mood',
                  ),
                  trailing: Switch.adaptive(
                    value: _cubit.isDark,
                    activeColor: Colors.deepOrange,
                    onChanged: (index) {
                      _cubit.changeTheme();
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.location_city_outlined,
                      color: Colors.deepOrange),
                  title: const Text('Select Country'),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text('Available Countries'),
                              content: SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      title: const Text(
                                        'Egypt',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      leading: Radio<String>(
                                        value: 'eg',
                                        groupValue: _cubit.countryKey,
                                        onChanged: (value) {
                                          _cubit.changeRadioValue(value!);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text(
                                        'USA',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      leading: Radio<String>(
                                        value: 'us',
                                        groupValue: _cubit.countryKey,
                                        onChanged: (value) {
                                          _cubit.changeRadioValue(value!);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        });
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
