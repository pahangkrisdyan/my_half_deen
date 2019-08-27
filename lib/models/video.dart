class Videos {

  String title;
  String url;
  String image;
  String category;

  Videos({this.title, this.url,this.image, this.category});

  factory Videos.fromJson(Map<String, dynamic> json) {
    return new Videos(
      title: json['title'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
    );
  }
}
