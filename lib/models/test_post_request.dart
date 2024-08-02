//import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        Album(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class PostRequestModel {
  PostRequestModel();

  static Future<Album> testPostRequest(String title) async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.post(uri, body: "{\"id\": 1}");

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw new Exception('Failed to load post');
    }
  }
}
