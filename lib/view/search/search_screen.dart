import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.adaptive.arrow_back)),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 10, bottom: 20),
                      child: defaultFormField(
                          context: context,
                          type: TextInputType.text,
                          isObscure: false,
                          controller: searchController,
                          icon: Icon(
                            Icons.search,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          title: 'Search',
                          validateText: 'Search bar must not be empty',
                          onChange: (value) {
                            if (value.isNotEmpty) {
                              cubit.getSearchData(value: value);
                            }
                          }),
                    ),
                  ),
                ],
              ),
              Expanded(child: buildListViewArticles(cubit.search))
            ],
          )),
        );
      },
    );
  }
}
