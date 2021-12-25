import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/modules/web_view/web_view.dart';

import 'package:news_app/shared/components/components.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.article}) : super(key: key);
  final News article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 30,
                child: Divider(
                  thickness: 2,
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: getImage(
                    url: article.imageUrl, width: double.infinity, height: 220),
              ),
              const SizedBox(
                height: 10,
                child: Divider(
                  thickness: 2,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '-- Description --',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(article.description ?? '',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey[700],
                      )),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '-- More Details --',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                article.content ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WebViewScreen(url: article.url!)));
                    },
                    child: const Text('Jump to The Resource.'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        fixedSize: const Size(300, 50)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
