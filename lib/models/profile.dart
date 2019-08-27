import 'dart:convert';

class Profile {

  String id;
  String nama;
  String email;
  String alamat;
  String telepon;
  String image;

  Profile({this.id, this.nama, this.email, this.alamat, this.telepon, this.image});

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "email": email, "alamat": alamat, "telepon": telepon, "image": image};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $nama, email: $email, alamat: $alamat, telepon: $telepon, image: $image}';
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return new Profile(
      id: json['id'] as String,
      nama: json['nama'] as String,
      email: json['email'] as String,
      alamat: json['alamat'] as String,
      telepon: json['telepon'] as String,
      image: json['image'] as String,
    );
  }
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
