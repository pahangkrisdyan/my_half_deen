import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tb_mhd/models/profile.dart';
import 'package:http/http.dart' as http;

import 'package:tb_mhd/models/chat.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tb_mhd/services/authentication.dart';

class ApiService {

  final String baseUrl = "http://0.0.0.0:5000";

  Future<bool> createProfile(String id) async {
    var response = await http.post(
      "$baseUrl/create/user",
      body: {
        'id': '${id}',
        'nama': '${id}',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Profile data) async {
//    var response = await http.post(
//      '$baseUrl/update/user',
//      body: {
//        'id': '${data.id}',
//        'nama': '${data.nama}',
//        'alamat': '${data.alamat}',
//        'email': '${data.email}',
//        'telepon': '${data.telepon}',
//        'image': '${data.image}',
//      },
//    );
  FirebaseUser user = await Auth().getCurrentUser();
  Firestore.instance.collection("users").document(user.uid)
    .updateData({
      "email": data.email,
      "phoneNumber": data.telepon,
      "name": data.nama,
      "image": data.image,
      "address": data.alamat
    }).catchError((err){
      return false;
    });
    return true;
  }

  Future<bool> createChat(Chat data) async {
    var response = await http.post(
      '$baseUrl/create/chat',
      body: {
        'id': '${data.id}',
        'tanggal': '${data.tanggal}',
        'node': '${data.node}',
        'pengirim': '${data.pengirim}',
        'penerima': '${data.penerima}',
        'konten': '${data.konten}',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}
