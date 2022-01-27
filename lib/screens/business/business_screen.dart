import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/news_bloc/news_bloc.dart';
import 'package:news_app/utill/components/components.dart';
import 'package:news_app/utill/components/widgets/shimmer_loading_widget.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is BusinessNewsSuccessState) {
          return buildListViewArticles(state.businessList);
        }
        return Container();
      },
    );
  }
}
