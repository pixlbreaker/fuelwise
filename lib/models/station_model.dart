// //import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Post {
//   final String userId;
//   final String title;
//   final String description;

//   Post({
//     required this.userId,
//     required this.title,
//     required this.description,
//   });
// }

// class StationModel {
//   String name;

//   StationModel({required this.name});

//   static List<StationModel> getStations() {
//     List<StationModel> stations = [];

//     return stations;
//   }

//   static String testString() {
//     return "this";
//   }

//   static Future<http.Response> stationPostRequest(String title) {
//     Future<http.Response> response = http.post(
//         Uri.parse('https://www.gasbuddy.com/graphql'),
//         headers: <String, String>{
//           'Accept': 'application/json',
//           'Content-Type': 'application/json',
//         },
//         body:
//             "{\"operationName\":\"LocationBySearchTerm\",\"variables\":{\"fuel\":1,\"maxAge\":0,\"search\":\"l5r 1k1\"},\"query\":\"query LocationBySearchTerm(\$brandId: Int, \$cursor: String, \$fuel: Int, \$lat: Float, \$lng: Float, \$maxAge: Int, \$search: String) {\\n  locationBySearchTerm(lat: \$lat, lng: \$lng, search: \$search) {\\n    countryCode\\n    displayName\\n    latitude\\n    longitude\\n    regionCode\\n    stations(\\n      brandId: \$brandId\\n      cursor: \$cursor\\n      fuel: \$fuel\\n      lat: \$lat\\n      lng: \$lng\\n      maxAge: \$maxAge\\n    ) {\\n      count\\n      cursor {\\n        next\\n        __typename\\n      }\\n      results {\\n        address {\\n          country\\n          line1\\n          line2\\n          locality\\n          postalCode\\n          region\\n          __typename\\n        }\\n        badges {\\n          badgeId\\n          callToAction\\n          campaignId\\n          clickTrackingUrl\\n          description\\n          detailsImageUrl\\n          detailsImpressionTrackingUrls\\n          imageUrl\\n          impressionTrackingUrls\\n          targetUrl\\n          title\\n          __typename\\n        }\\n        brands {\\n          brandId\\n          brandingType\\n          imageUrl\\n          name\\n          __typename\\n        }\\n        distance\\n        emergencyStatus {\\n          hasDiesel {\\n            nickname\\n            reportStatus\\n            updateDate\\n            __typename\\n          }\\n          hasGas {\\n            nickname\\n            reportStatus\\n            updateDate\\n            __typename\\n          }\\n          hasPower {\\n            nickname\\n            reportStatus\\n            updateDate\\n            __typename\\n          }\\n          __typename\\n        }\\n        enterprise\\n        fuels\\n        hasActiveOutage\\n        id\\n        name\\n        offers {\\n          discounts {\\n            grades\\n            highlight\\n            pwgbDiscount\\n            receiptDiscount\\n            __typename\\n          }\\n          highlight\\n          id\\n          types\\n          use\\n          __typename\\n        }\\n        payStatus {\\n          isPayAvailable\\n          __typename\\n        }\\n        prices {\\n          cash {\\n            nickname\\n            postedTime\\n            price\\n            formattedPrice\\n            __typename\\n          }\\n          credit {\\n            nickname\\n            postedTime\\n            price\\n            formattedPrice\\n            __typename\\n          }\\n          discount\\n          fuelProduct\\n          __typename\\n        }\\n        priceUnit\\n        ratingsCount\\n        starRating\\n        __typename\\n      }\\n      __typename\\n    }\\n    trends {\\n      areaName\\n      country\\n      today\\n      todayLow\\n      trend\\n      __typename\\n    }\\n    __typename\\n  }\\n}\"}"
//         // body: jsonEncode(<String, String>{
//         //   'test': 'value',
//         // }),
//         );

//     return response;
//   }

//   // static Future<Post> testPostRequest(String title) {
//   //   final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
//   // }
// }
