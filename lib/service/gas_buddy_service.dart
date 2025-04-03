//import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:http/http.dart' as http;

class GasBuddyService {
  GasBuddyService();

  // Makes the Post Request
  Future<GasBuddyModel> stationPostRequest(String searchTerm) async {
    // Body Information
    var postData = json.encode({
      "operationName": "LocationBySearchTerm",
      "variables": {"fuel": 1, "maxAge": 0, "search": searchTerm},
      "query":
          "query LocationBySearchTerm(\$brandId: Int, \$cursor: String, \$search: String) { locationBySearchTerm(search: \$search) { stations(brandId: \$brandId, cursor: \$cursor) { count cursor { next __typename } results { address {  country  line1  line2  locality  postalCode  region  __typename} fuels id name prices { cash { nickname postedTime price __typename } credit { nickname postedTime price __typename } } } __typename } __typename }}"
    });

    // Makes the post Request
    final response =
        await http.post(Uri.parse('https://www.gasbuddy.com/graphql'),
            headers: <String, String>{
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            body: postData);

    // Decodes the data
    if (response.statusCode == 200) {
      return GasBuddyModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
