//import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:http/http.dart' as http;

class GasBuddyService {
  GasBuddyService();

  // Makes the Post Request
  Future<Data> stationPostRequest(String searchTerm) async {
    final response = await http.post(
        Uri.parse('https://www.gasbuddy.com/graphql'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body:
            "{\"operationName\":\"LocationBySearchTerm\",\"variables\":{\"fuel\":1,\"maxAge\":0,\"search\":\"Mississauga\"},\"query\": \"query LocationBySearchTerm(\$brandId: Int, \$cursor: String, \$maxAge: Int, \$search: String) { locationBySearchTerm(search: \$search) { stations(brandId: \$brandId, cursor: \$cursor, maxAge: \$maxAge) { count cursor { next __typename } results { fuels id name prices { cash { nickname postedTime price __typename } credit { nickname postedTime price __typename } } } __typename } trends { areaName country today todayLow trend __typename } __typename }}");

    if (response.statusCode == 200) {
      return Data.fromJson(json.decode(response.body));
    } else {
      throw new Exception('Failed to load post');
    }
  }
}
