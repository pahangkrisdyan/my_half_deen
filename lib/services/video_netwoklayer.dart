import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tb_mhd/models/video.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Videos>> fetchVideo(http.Client client, String param) async {
  print("fetchUstadz");
  QuerySnapshot querySnapshot = await Firestore.instance.collection('videos').getDocuments();
  List<DocumentSnapshot> documentSnapshots =  querySnapshot.documents;
  List<Videos> videos = List();
  documentSnapshots.forEach((docSnap){
    Videos a = Videos(
      url: docSnap.data["url"],
      category: docSnap.data["category"],
      image: docSnap.data["image"],
      title: docSnap.data["title"],
    );
    videos.add(a);
  });
  return videos;
}

// A function that will convert a response body into a List<Country>
List<Videos> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Videos> list =
      parsed.map<Videos>((json) => new Videos.fromJson(json)).toList();
  return list;
}
