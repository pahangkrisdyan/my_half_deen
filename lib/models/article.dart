class Articles {

  String title;
  String content;
  String image;
  String category;

  Articles({this.title, this.content,this.image, this.category});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return new Articles(
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
    );
  }
}
