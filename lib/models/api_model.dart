class ApiModel {
  String? sourceName;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  ApiModel({
    this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });
}
