class ApiModel {
  String? sourceName;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String? publishedAt;
  String? content;
  String? category;

  ApiModel({
    this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    this.publishedAt,
    required this.content,
    required this.category,
  });
}
