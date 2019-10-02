class Post {
  final int id;
  final String title;
  final String body;

  Post(
    this.id,
    this.title,
    this.body,
  );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      json["id"] ?? 0,
      json["title"] ?? "",
      json["body"] ?? "",
    );
  }
}
