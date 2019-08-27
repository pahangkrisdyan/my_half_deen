import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tb_mhd/models/chat.dart';
import 'package:http/http.dart' as http;

Future<List<Chat>> fetchChat(http.Client client, String param) async {
  final response = await client.get('http://0.0.0.0:5000/chat/'+param);
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<Chat> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Chat> list =
      parsed.map<Chat>((json) => new Chat.fromJson(json)).toList();
  return list;
}
