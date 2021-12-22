class News {
  String? title;
  String? description;
  String? url;
  String? imageUrl;
  String? content;
  String? publishAt;

  News({
    this.title,
    this.description,
    this.url,
    this.imageUrl,
    this.content,
    this.publishAt,
  });
  News fromJson(Map<String, dynamic> newsList) {
    return News(
        title: newsList['title'],
        description: newsList['description'],
        url: newsList['url'],
        imageUrl: newsList['urlToImage'],
        content: newsList['content'],
        publishAt: newsList['publishedAt']);
  }
}
