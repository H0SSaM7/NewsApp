import 'package:flutter/material.dart';

ListView buildListViewArticles(List<dynamic> articles) {
  return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(11),
          height: 120,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _getImage(articles[index].imageUrl),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(articles[index].title!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1),
                    const Spacer(),
                    Text(
                      articles[index].publishAt!,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(
                width: 6.0,
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: articles.length);
}

Widget _getImage(String? url) {
  Widget image;
  if (url == null) {
    image = Image.asset(
      'images/noImage.png',
      width: 130,
      height: 120,
      fit: BoxFit.fill,
    );
    return image;
  } else {
    image = Image.network(
      url,
      width: 130,
      height: 120,
      fit: BoxFit.fill,
    );
    return image;
  }
}
