import 'dart:convert';

class Data {
  LocationBySearchTerm? locationBySearchTerm;

  Data({
    this.locationBySearchTerm,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        locationBySearchTerm: json["locationBySearchTerm"] == null
            ? null
            : LocationBySearchTerm.fromJson(json["locationBySearchTerm"]),
      );

  Map<String, dynamic> toJson() => {
        "locationBySearchTerm": locationBySearchTerm?.toJson(),
      };
}

class LocationBySearchTerm {
  dynamic countryCode;
  DisplayName? displayName;
  double? latitude;
  double? longitude;
  dynamic regionCode;
  Stations? stations;
  List<Trend>? trends;
  String? typename;

  LocationBySearchTerm({
    this.countryCode,
    this.displayName,
    this.latitude,
    this.longitude,
    this.regionCode,
    this.stations,
    this.trends,
    this.typename,
  });

  factory LocationBySearchTerm.fromJson(Map<String, dynamic> json) =>
      LocationBySearchTerm(
        countryCode: json["countryCode"],
        displayName: displayNameValues.map[json["displayName"]]!,
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        regionCode: json["regionCode"],
        stations: json["stations"] == null
            ? null
            : Stations.fromJson(json["stations"]),
        trends: json["trends"] == null
            ? []
            : List<Trend>.from(json["trends"]!.map((x) => Trend.fromJson(x))),
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "displayName": displayNameValues.reverse[displayName],
        "latitude": latitude,
        "longitude": longitude,
        "regionCode": regionCode,
        "stations": stations?.toJson(),
        "trends": trends == null
            ? []
            : List<dynamic>.from(trends!.map((x) => x.toJson())),
        "__typename": typename,
      };
}

enum DisplayName { MISSISSAUGA }

final displayNameValues = EnumValues({"Mississauga": DisplayName.MISSISSAUGA});

class Stations {
  int? count;
  Cursor? cursor;
  List<Result>? results;
  String? typename;

  Stations({
    this.count,
    this.cursor,
    this.results,
    this.typename,
  });

  factory Stations.fromJson(Map<String, dynamic> json) => Stations(
        count: json["count"],
        cursor: json["cursor"] == null ? null : Cursor.fromJson(json["cursor"]),
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "cursor": cursor?.toJson(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "__typename": typename,
      };
}

class Cursor {
  String? next;
  String? typename;

  Cursor({
    this.next,
    this.typename,
  });

  factory Cursor.fromJson(Map<String, dynamic> json) => Cursor(
        next: json["next"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "__typename": typename,
      };
}

class Result {
  Address? address;
  List<Badge>? badges;
  List<Brand>? brands;
  dynamic distance;
  dynamic emergencyStatus;
  bool? enterprise;
  List<Fuel>? fuels;
  bool? hasActiveOutage;
  String? id;
  String? name;
  List<Offer>? offers;
  dynamic payStatus;
  List<Price>? prices;
  PriceUnit? priceUnit;
  int? ratingsCount;
  double? starRating;
  ResultTypename? typename;

  Result({
    this.address,
    this.badges,
    this.brands,
    this.distance,
    this.emergencyStatus,
    this.enterprise,
    this.fuels,
    this.hasActiveOutage,
    this.id,
    this.name,
    this.offers,
    this.payStatus,
    this.prices,
    this.priceUnit,
    this.ratingsCount,
    this.starRating,
    this.typename,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        badges: json["badges"] == null
            ? []
            : List<Badge>.from(json["badges"]!.map((x) => Badge.fromJson(x))),
        brands: json["brands"] == null
            ? []
            : List<Brand>.from(json["brands"]!.map((x) => Brand.fromJson(x))),
        distance: json["distance"],
        emergencyStatus: json["emergencyStatus"],
        enterprise: json["enterprise"],
        fuels: json["fuels"] == null
            ? []
            : List<Fuel>.from(json["fuels"]!.map((x) => fuelValues.map[x]!)),
        hasActiveOutage: json["hasActiveOutage"],
        id: json["id"],
        name: json["name"],
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
        payStatus: json["payStatus"],
        prices: json["prices"] == null
            ? []
            : List<Price>.from(json["prices"]!.map((x) => Price.fromJson(x))),
        priceUnit: priceUnitValues.map[json["priceUnit"]]!,
        ratingsCount: json["ratingsCount"],
        starRating: json["starRating"]?.toDouble(),
        typename: resultTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "badges": badges == null
            ? []
            : List<dynamic>.from(badges!.map((x) => x.toJson())),
        "brands": brands == null
            ? []
            : List<dynamic>.from(brands!.map((x) => x.toJson())),
        "distance": distance,
        "emergencyStatus": emergencyStatus,
        "enterprise": enterprise,
        "fuels": fuels == null
            ? []
            : List<dynamic>.from(fuels!.map((x) => fuelValues.reverse[x])),
        "hasActiveOutage": hasActiveOutage,
        "id": id,
        "name": name,
        "offers": offers == null
            ? []
            : List<dynamic>.from(offers!.map((x) => x.toJson())),
        "payStatus": payStatus,
        "prices": prices == null
            ? []
            : List<dynamic>.from(prices!.map((x) => x.toJson())),
        "priceUnit": priceUnitValues.reverse[priceUnit],
        "ratingsCount": ratingsCount,
        "starRating": starRating,
        "__typename": resultTypenameValues.reverse[typename],
      };
}

class Address {
  Country? country;
  String? line1;
  String? line2;
  DisplayName? locality;
  String? postalCode;
  Region? region;
  AddressTypename? typename;

  Address({
    this.country,
    this.line1,
    this.line2,
    this.locality,
    this.postalCode,
    this.region,
    this.typename,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: countryValues.map[json["country"]]!,
        line1: json["line1"],
        line2: json["line2"],
        locality: displayNameValues.map[json["locality"]]!,
        postalCode: json["postalCode"],
        region: regionValues.map[json["region"]]!,
        typename: addressTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "line1": line1,
        "line2": line2,
        "locality": displayNameValues.reverse[locality],
        "postalCode": postalCode,
        "region": regionValues.reverse[region],
        "__typename": addressTypenameValues.reverse[typename],
      };
}

enum Country { CA }

final countryValues = EnumValues({"CA": Country.CA});

enum Region { ON }

final regionValues = EnumValues({"ON": Region.ON});

enum AddressTypename { ADDRESS }

final addressTypenameValues = EnumValues({"Address": AddressTypename.ADDRESS});

class Badge {
  String? badgeId;
  String? callToAction;
  String? campaignId;
  String? clickTrackingUrl;
  String? description;
  String? detailsImageUrl;
  List<dynamic>? detailsImpressionTrackingUrls;
  String? imageUrl;
  List<String>? impressionTrackingUrls;
  String? targetUrl;
  String? title;
  String? typename;

  Badge({
    this.badgeId,
    this.callToAction,
    this.campaignId,
    this.clickTrackingUrl,
    this.description,
    this.detailsImageUrl,
    this.detailsImpressionTrackingUrls,
    this.imageUrl,
    this.impressionTrackingUrls,
    this.targetUrl,
    this.title,
    this.typename,
  });

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        badgeId: json["badgeId"],
        callToAction: json["callToAction"],
        campaignId: json["campaignId"],
        clickTrackingUrl: json["clickTrackingUrl"],
        description: json["description"],
        detailsImageUrl: json["detailsImageUrl"],
        detailsImpressionTrackingUrls:
            json["detailsImpressionTrackingUrls"] == null
                ? []
                : List<dynamic>.from(
                    json["detailsImpressionTrackingUrls"]!.map((x) => x)),
        imageUrl: json["imageUrl"],
        impressionTrackingUrls: json["impressionTrackingUrls"] == null
            ? []
            : List<String>.from(json["impressionTrackingUrls"]!.map((x) => x)),
        targetUrl: json["targetUrl"],
        title: json["title"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "badgeId": badgeId,
        "callToAction": callToAction,
        "campaignId": campaignId,
        "clickTrackingUrl": clickTrackingUrl,
        "description": description,
        "detailsImageUrl": detailsImageUrl,
        "detailsImpressionTrackingUrls": detailsImpressionTrackingUrls == null
            ? []
            : List<dynamic>.from(detailsImpressionTrackingUrls!.map((x) => x)),
        "imageUrl": imageUrl,
        "impressionTrackingUrls": impressionTrackingUrls == null
            ? []
            : List<dynamic>.from(impressionTrackingUrls!.map((x) => x)),
        "targetUrl": targetUrl,
        "title": title,
        "__typename": typename,
      };
}

class Brand {
  String? brandId;
  BrandingType? brandingType;
  String? imageUrl;
  String? name;
  BrandTypename? typename;

  Brand({
    this.brandId,
    this.brandingType,
    this.imageUrl,
    this.name,
    this.typename,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        brandId: json["brandId"],
        brandingType: brandingTypeValues.map[json["brandingType"]]!,
        imageUrl: json["imageUrl"],
        name: json["name"],
        typename: brandTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "brandId": brandId,
        "brandingType": brandingTypeValues.reverse[brandingType],
        "imageUrl": imageUrl,
        "name": name,
        "__typename": brandTypenameValues.reverse[typename],
      };
}

enum BrandingType { CSTORE, FUEL }

final brandingTypeValues =
    EnumValues({"cstore": BrandingType.CSTORE, "fuel": BrandingType.FUEL});

enum BrandTypename { BRAND }

final brandTypenameValues = EnumValues({"Brand": BrandTypename.BRAND});

enum Fuel { DIESEL, MIDGRADE_GAS, PREMIUM_GAS, REGULAR_GAS }

final fuelValues = EnumValues({
  "diesel": Fuel.DIESEL,
  "midgrade_gas": Fuel.MIDGRADE_GAS,
  "premium_gas": Fuel.PREMIUM_GAS,
  "regular_gas": Fuel.REGULAR_GAS
});

class Offer {
  List<Discount>? discounts;
  String? highlight;
  String? id;
  List<Type>? types;
  List<Use>? use;
  OfferTypename? typename;

  Offer({
    this.discounts,
    this.highlight,
    this.id,
    this.types,
    this.use,
    this.typename,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        discounts: json["discounts"] == null
            ? []
            : List<Discount>.from(
                json["discounts"]!.map((x) => Discount.fromJson(x))),
        highlight: json["highlight"],
        id: json["id"],
        types: json["types"] == null
            ? []
            : List<Type>.from(json["types"]!.map((x) => typeValues.map[x]!)),
        use: json["use"] == null
            ? []
            : List<Use>.from(json["use"]!.map((x) => useValues.map[x]!)),
        typename: offerTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "discounts": discounts == null
            ? []
            : List<dynamic>.from(discounts!.map((x) => x.toJson())),
        "highlight": highlight,
        "id": id,
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => typeValues.reverse[x])),
        "use": use == null
            ? []
            : List<dynamic>.from(use!.map((x) => useValues.reverse[x])),
        "__typename": offerTypenameValues.reverse[typename],
      };
}

class Discount {
  List<Fuel>? grades;
  String? highlight;
  String? pwgbDiscount;
  dynamic receiptDiscount;
  DiscountTypename? typename;

  Discount({
    this.grades,
    this.highlight,
    this.pwgbDiscount,
    this.receiptDiscount,
    this.typename,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        grades: json["grades"] == null
            ? []
            : List<Fuel>.from(json["grades"]!.map((x) => fuelValues.map[x]!)),
        highlight: json["highlight"],
        pwgbDiscount: json["pwgbDiscount"],
        receiptDiscount: json["receiptDiscount"],
        typename: discountTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "grades": grades == null
            ? []
            : List<dynamic>.from(grades!.map((x) => fuelValues.reverse[x])),
        "highlight": highlight,
        "pwgbDiscount": pwgbDiscount,
        "receiptDiscount": receiptDiscount,
        "__typename": discountTypenameValues.reverse[typename],
      };
}

enum DiscountTypename { DISCOUNT }

final discountTypenameValues =
    EnumValues({"Discount": DiscountTypename.DISCOUNT});

enum OfferTypename { OFFER }

final offerTypenameValues = EnumValues({"Offer": OfferTypename.OFFER});

enum Type { GASBUDDY }

final typeValues = EnumValues({"gasbuddy": Type.GASBUDDY});

enum Use { SORT, STRIKE }

final useValues = EnumValues({"sort": Use.SORT, "strike": Use.STRIKE});

enum PriceUnit { CENTS_PER_LITER }

final priceUnitValues =
    EnumValues({"cents_per_liter": PriceUnit.CENTS_PER_LITER});

class Price {
  dynamic cash;
  Credit? credit;
  int? discount;
  Fuel? fuelProduct;
  PriceTypename? typename;

  Price({
    this.cash,
    this.credit,
    this.discount,
    this.fuelProduct,
    this.typename,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        cash: json["cash"],
        credit: json["credit"] == null ? null : Credit.fromJson(json["credit"]),
        discount: json["discount"],
        fuelProduct: fuelValues.map[json["fuelProduct"]]!,
        typename: priceTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "cash": cash,
        "credit": credit?.toJson(),
        "discount": discount,
        "fuelProduct": fuelValues.reverse[fuelProduct],
        "__typename": priceTypenameValues.reverse[typename],
      };
}

class Credit {
  String? nickname;
  DateTime? postedTime;
  double? price;
  String? formattedPrice;
  CreditTypename? typename;

  Credit({
    this.nickname,
    this.postedTime,
    this.price,
    this.formattedPrice,
    this.typename,
  });

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        nickname: json["nickname"],
        postedTime: json["postedTime"] == null
            ? null
            : DateTime.parse(json["postedTime"]),
        price: json["price"]?.toDouble(),
        formattedPrice: json["formattedPrice"],
        typename: creditTypenameValues.map[json["__typename"]]!,
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "postedTime": postedTime?.toIso8601String(),
        "price": price,
        "formattedPrice": formattedPrice,
        "__typename": creditTypenameValues.reverse[typename],
      };
}

enum CreditTypename { FUEL_PRICE }

final creditTypenameValues =
    EnumValues({"FuelPrice": CreditTypename.FUEL_PRICE});

enum PriceTypename { PRICE_REPORT }

final priceTypenameValues =
    EnumValues({"PriceReport": PriceTypename.PRICE_REPORT});

enum ResultTypename { STATION }

final resultTypenameValues = EnumValues({"Station": ResultTypename.STATION});

class Trend {
  String? areaName;
  Country? country;
  double? today;
  double? todayLow;
  int? trend;
  String? typename;

  Trend({
    this.areaName,
    this.country,
    this.today,
    this.todayLow,
    this.trend,
    this.typename,
  });

  factory Trend.fromJson(Map<String, dynamic> json) => Trend(
        areaName: json["areaName"],
        country: countryValues.map[json["country"]]!,
        today: json["today"]?.toDouble(),
        todayLow: json["todayLow"]?.toDouble(),
        trend: json["trend"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "areaName": areaName,
        "country": countryValues.reverse[country],
        "today": today,
        "todayLow": todayLow,
        "trend": trend,
        "__typename": typename,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
