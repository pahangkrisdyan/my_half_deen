class Chat {

  String id;
  String tanggal;
  String node;
  String pengirim;
  String penerima;
  String konten;

  Chat({this.id, this.tanggal, this.node, this.pengirim, this.penerima, this.konten});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return new Chat(
      id: json['id'] as String,
      tanggal: json['tanggal'] as String,
      node: json['node'] as String,
      pengirim: json['pengirim'] as String,
      penerima: json['penerima'] as String,
      konten: json['konten'] as String,
    );
  }
}
