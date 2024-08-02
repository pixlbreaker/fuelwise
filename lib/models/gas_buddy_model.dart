// Class to represent the main location data
class LocationBySearchTerm {
  // Fields corresponding to JSON properties
  String? countryCode;
  String displayName;
  double latitude;
  double longitude;
  String? regionCode;
  Stations stations;

  // Constructor
  LocationBySearchTerm({
    this.countryCode,
    required this.displayName,
    required this.latitude,
    required this.longitude,
    this.regionCode,
    required this.stations,
  });

  // Factory method to create an instance from a JSON map
  factory LocationBySearchTerm.fromJson(Map<String, dynamic> json) {
    return LocationBySearchTerm(
      countryCode: json['countryCode'],
      displayName: json['displayName'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      regionCode: json['regionCode'],
      stations: Stations.fromJson(json['stations']),
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'countryCode': countryCode,
      'displayName': displayName,
      'latitude': latitude,
      'longitude': longitude,
      'regionCode': regionCode,
      'stations': stations.toJson(),
    };
  }
}

// Class to represent a collection of stations
class Stations {
  int count;
  Cursor cursor;
  List<Station> results;

  Stations({
    required this.count,
    required this.cursor,
    required this.results,
  });

  // Factory method to create an instance from a JSON map
  factory Stations.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List;
    List<Station> results =
        resultsList.map((i) => Station.fromJson(i)).toList();

    return Stations(
      count: json['count'],
      cursor: Cursor.fromJson(json['cursor']),
      results: results,
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'cursor': cursor.toJson(),
      'results': results.map((station) => station.toJson()).toList(),
    };
  }
}

// Class to represent the cursor for pagination
class Cursor {
  String next;
  String typename;

  Cursor({
    required this.next,
    required this.typename,
  });

  // Factory method to create an instance from a JSON map
  factory Cursor.fromJson(Map<String, dynamic> json) {
    return Cursor(
      next: json['next'],
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'next': next,
      '__typename': typename,
    };
  }
}

// Class to represent a single station
class Station {
  Address address;
  List<Badge> badges;
  List<Brand> brands;
  bool enterprise;
  List<String> fuels;
  bool hasActiveOutage;
  String id;
  String name;
  List<Offer> offers;
  List<PriceReport> prices;
  String priceUnit;
  int ratingsCount;
  double starRating;
  String typename;

  Station({
    required this.address,
    required this.badges,
    required this.brands,
    required this.enterprise,
    required this.fuels,
    required this.hasActiveOutage,
    required this.id,
    required this.name,
    required this.offers,
    required this.prices,
    required this.priceUnit,
    required this.ratingsCount,
    required this.starRating,
    required this.typename,
  });

  // Factory method to create an instance from a JSON map
  factory Station.fromJson(Map<String, dynamic> json) {
    var badgesList = json['badges'] as List;
    List<Badge> badges = badgesList.map((i) => Badge.fromJson(i)).toList();

    var brandsList = json['brands'] as List;
    List<Brand> brands = brandsList.map((i) => Brand.fromJson(i)).toList();

    var offersList = json['offers'] as List;
    List<Offer> offers = offersList.map((i) => Offer.fromJson(i)).toList();

    var pricesList = json['prices'] as List;
    List<PriceReport> prices =
        pricesList.map((i) => PriceReport.fromJson(i)).toList();

    return Station(
      address: Address.fromJson(json['address']),
      badges: badges,
      brands: brands,
      enterprise: json['enterprise'],
      fuels: List<String>.from(json['fuels']),
      hasActiveOutage: json['hasActiveOutage'],
      id: json['id'],
      name: json['name'],
      offers: offers,
      prices: prices,
      priceUnit: json['priceUnit'],
      ratingsCount: json['ratingsCount'],
      starRating: json['starRating'],
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'address': address.toJson(),
      'badges': badges.map((badge) => badge.toJson()).toList(),
      'brands': brands.map((brand) => brand.toJson()).toList(),
      'enterprise': enterprise,
      'fuels': fuels,
      'hasActiveOutage': hasActiveOutage,
      'id': id,
      'name': name,
      'offers': offers.map((offer) => offer.toJson()).toList(),
      'prices': prices.map((price) => price.toJson()).toList(),
      'priceUnit': priceUnit,
      'ratingsCount': ratingsCount,
      'starRating': starRating,
      '__typename': typename,
    };
  }
}

// Class to represent an address
class Address {
  String country;
  String line1;
  String? line2;
  String locality;
  String postalCode;
  String region;
  String typename;

  Address({
    required this.country,
    required this.line1,
    this.line2,
    required this.locality,
    required this.postalCode,
    required this.region,
    required this.typename,
  });

  // Factory method to create an instance from a JSON map
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: json['country'],
      line1: json['line1'],
      line2: json['line2'],
      locality: json['locality'],
      postalCode: json['postalCode'],
      region: json['region'],
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'line1': line1,
      'line2': line2,
      'locality': locality,
      'postalCode': postalCode,
      'region': region,
      '__typename': typename,
    };
  }
}

// Class to represent a badge
class Badge {
  String typename;

  Badge({required this.typename});

  // Factory method to create an instance from a JSON map
  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      '__typename': typename,
    };
  }
}

// Class to represent a brand
class Brand {
  String brandId;
  String brandingType;
  String imageUrl;
  String name;
  String typename;

  Brand({
    required this.brandId,
    required this.brandingType,
    required this.imageUrl,
    required this.name,
    required this.typename,
  });

  // Factory method to create an instance from a JSON map
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      brandId: json['brandId'],
      brandingType: json['brandingType'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'brandingType': brandingType,
      'imageUrl': imageUrl,
      'name': name,
      '__typename': typename,
    };
  }
}

// Class to represent an offer
class Offer {
  List<Discount> discounts;
  String highlight;
  String id;
  List<String> types;
  List<String> use;
  String typename;

  Offer({
    required this.discounts,
    required this.highlight,
    required this.id,
    required this.types,
    required this.use,
    required this.typename,
  });

  // Factory method to create an instance from a JSON map
  factory Offer.fromJson(Map<String, dynamic> json) {
    var discountsList = json['discounts'] as List;
    List<Discount> discounts =
        discountsList.map((i) => Discount.fromJson(i)).toList();

    return Offer(
      discounts: discounts,
      highlight: json['highlight'],
      id: json['id'],
      types: List<String>.from(json['types']),
      use: List<String>.from(json['use']),
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'discounts': discounts.map((discount) => discount.toJson()).toList(),
      'highlight': highlight,
      'id': id,
      'types': types,
      'use': use,
      '__typename': typename,
    };
  }
}

// Class to represent a discount
class Discount {
  List<String> grades;
  String highlight;
  String pwgbDiscount;
  String? receiptDiscount;
  String typename;

  Discount({
    required this.grades,
    required this.highlight,
    required this.pwgbDiscount,
    this.receiptDiscount,
    required this.typename,
  });

  // Factory method to create an instance from a JSON map
  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      grades: List<String>.from(json['grades']),
      highlight: json['highlight'],
      pwgbDiscount: json['pwgbDiscount'],
      receiptDiscount: json['receiptDiscount'],
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'grades': grades,
      'highlight': highlight,
      'pwgbDiscount': pwgbDiscount,
      'receiptDiscount': receiptDiscount,
      '__typename': typename,
    };
  }
}

// Class to represent a price report
class PriceReport {
  FuelPrice? cash;
  FuelPrice credit;
  double discount;
  String fuelProduct;
  String typename;

  PriceReport({
    this.cash,
    required this.credit,
    required this.discount,
    required this.fuelProduct,
    required this.typename,
  });

  // Factory method to create an instance from a JSON map
  factory PriceReport.fromJson(Map<String, dynamic> json) {
    return PriceReport(
      cash: json['cash'] != null ? FuelPrice.fromJson(json['cash']) : null,
      credit: FuelPrice.fromJson(json['credit']),
      discount: json['discount'],
      fuelProduct: json['fuelProduct'],
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'cash': cash?.toJson(),
      'credit': credit.toJson(),
      'discount': discount,
      'fuelProduct': fuelProduct,
      '__typename': typename,
    };
  }
}

// Class to represent a fuel price
class FuelPrice {
  String nickname;
  String postedTime;
  double price;
  String formattedPrice;
  String typename;

  FuelPrice({
    required this.nickname,
    required this.postedTime,
    required this.price,
    required this.formattedPrice,
    required this.typename,
  });

  // Factory method to create an instance from a JSON map
  factory FuelPrice.fromJson(Map<String, dynamic> json) {
    return FuelPrice(
      nickname: json['nickname'],
      postedTime: json['postedTime'],
      price: json['price'],
      formattedPrice: json['formattedPrice'],
      typename: json['__typename'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'postedTime': postedTime,
      'price': price,
      'formattedPrice': formattedPrice,
      '__typename': typename,
    };
  }
}
