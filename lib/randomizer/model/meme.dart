class Meme {
  final String postLink;
  final String url;
  final String author;
  final int ups;

  Meme({
    required this.postLink,
    required this.url,
    required this.author,
    required this.ups,
  });

  static Meme fromJson(Map<String, dynamic> json) {
    return Meme(
      postLink: json["postLink"],
      url: json["url"],
      author: json["author"],
      ups: json["ups"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "postLink": postLink,
      "url": url,
      "author": author,
      "ups": ups,
    };
  }
}
