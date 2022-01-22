class NewsModel {
  String? title;
  String? description;
  String? url;
  String? imageUrl;
  String? content;
  String? publishAt;

  NewsModel({
    this.title,
    this.description,
    this.url,
    this.imageUrl,
    this.content,
    this.publishAt,
  });
  NewsModel fromJson(Map<String, dynamic> newsList) {
    return NewsModel(
        title: newsList['title'],
        description: newsList['description'],
        url: newsList['url'],
        imageUrl: newsList['urlToImage'],
        content: newsList['content'],
        publishAt: newsList['publishedAt']);
  }
}
