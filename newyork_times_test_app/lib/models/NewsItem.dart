class NewsItem {
  String title;
  String url;
  String thumbnail;

  NewsItem(data) {
    this.title = data['title'];
    this.url = data['url'];
    this.thumbnail = data['multimedia'][0]['url'];
  }

  NewsItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        url = json['url'],
        thumbnail = json['thumbnail'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'thumbnail': thumbnail,
      };
}
