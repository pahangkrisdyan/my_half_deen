import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:tb_mhd/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tb_mhd/models/article.dart';

Future<List<Articles>> fetchArticle(http.Client client, String param) async {
  print("fetchArticle");
  QuerySnapshot querySnapshot = await Firestore.instance.collection('articles').getDocuments();
  List<DocumentSnapshot> documentSnapshots =  querySnapshot.documents;
  List<Articles> articles = List();
  documentSnapshots.forEach((docSnap){
    Articles a = Articles(
      category: docSnap.data["category"],
      content: docSnap.data["content"],
      image: docSnap.data["image"],
      title: docSnap.data["title"]
    );
    articles.add(a);
  });
  return articles;
}

// A function that will convert a response body into a List<Country>
List<Articles> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Articles> list =
      parsed.map<Articles>((json) => new Articles.fromJson(json)).toList();
  return list;
}
