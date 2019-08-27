class Ustadz {

  String id;
  String nama;
  String image;

  Ustadz({this.id, this.nama, this.image});

  factory Ustadz.fromJson(Map<String, dynamic> json) {
    return new Ustadz(
      id: json['id'] as String,
      nama: json['nama'] as String,
      image: json['image'] as String,
    );
  }
}
