import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tb_mhd/models/ustadz.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Ustadz>> fetchUstadz(http.Client client) async {
  print("fetchUstadz");
  QuerySnapshot querySnapshot = await Firestore.instance.collection('ustadz').getDocuments();
  List<DocumentSnapshot> documentSnapshots =  querySnapshot.documents;
  List<Ustadz> ustadzs = List();
  documentSnapshots.forEach((docSnap){
    Ustadz a = Ustadz(
      id: docSnap.data["category"],
      image: docSnap.data["image"],
      nama:   docSnap.data["name"],
    );
    ustadzs.add(a);
  });
  return ustadzs;
}

// A function that will convert a response body into a List<Country>
List<Ustadz> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Ustadz> list =
      parsed.map<Ustadz>((json) => new Ustadz.fromJson(json)).toList();
  return list;
}
