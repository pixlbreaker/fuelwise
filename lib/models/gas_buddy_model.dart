class GasBuddyModel {
  GasBuddyModel({
    required this.data,
  });
  late final Data data;

  GasBuddyModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.locationBySearchTerm,
  });
  late final LocationBySearchTerm locationBySearchTerm;

  Data.fromJson(Map<String, dynamic> json) {
    locationBySearchTerm =
        LocationBySearchTerm.fromJson(json['locationBySearchTerm']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['locationBySearchTerm'] = locationBySearchTerm.toJson();
    return _data;
  }
}

class LocationBySearchTerm {
  LocationBySearchTerm({
    required this.stations,
    required this.typename,
  });
  late final Stations stations;
  late final String typename;

  LocationBySearchTerm.fromJson(Map<String, dynamic> json) {
    stations = Stations.fromJson(json['stations']);
    typename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['stations'] = stations.toJson();
    _data['__typename'] = typename;
    return _data;
  }
}

class Stations {
  Stations({
    required this.count,
    required this.cursor,
    required this.results,
    required this.typename,
  });
  late final int count;
  late final Cursor cursor;
  late final List<Results> results;
  late final String typename;

  Stations.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    cursor = Cursor.fromJson(json['cursor']);
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
    typename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['cursor'] = cursor.toJson();
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['__typename'] = typename;
    return _data;
  }
}

class Cursor {
  Cursor({
    required this.next,
    required this.typename,
  });
  late final String next;
  late final String typename;

  Cursor.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    typename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['next'] = next;
    _data['__typename'] = typename;
    return _data;
  }
}

class Results {
  Results({
    required this.address,
    required this.fuels,
    required this.id,
    required this.name,
    required this.prices,
  });
  late final Address address;
  late final List<String> fuels;
  late final String id;
  late final String name;
  late final List<Prices> prices;

  Results.fromJson(Map<String, dynamic> json) {
    try {
      address = Address.fromJson(json['address']);
    } on Exception catch (_) {
      address = Address(
          country: "",
          line1: "",
          line2: "",
          locality: "",
          postalCode: "",
          region: "",
          typename: "");
    }
    fuels = List.castFrom<dynamic, String>(json['fuels']);
    id = json['id'];
    name = json['name'];
    prices = List.from(json['prices']).map((e) => Prices.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address.toJson();
    _data['fuels'] = fuels;
    _data['id'] = id;
    _data['name'] = name;
    _data['prices'] = prices.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Address {
  Address({
    required this.country,
    required this.line1,
    required this.line2,
    required this.locality,
    required this.postalCode,
    required this.region,
    required this.typename,
  });
  late final String country;
  late final String line1;
  late final String line2;
  late final String locality;
  late final String postalCode;
  late final String region;
  late final String typename;

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    line1 = json['line1'];
    line2 = json['line2'];
    locality = json['locality'];
    postalCode = json['postalCode'];
    region = json['region'];
    typename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country'] = country;
    _data['line1'] = line1;
    _data['line2'] = line2;
    _data['locality'] = locality;
    _data['postalCode'] = postalCode;
    _data['region'] = region;
    _data['__typename'] = typename;
    return _data;
  }
}

class Prices {
  Prices({
    this.cash,
    required this.credit,
  });
  late final Null cash;
  late final Credit credit;

  Prices.fromJson(Map<String, dynamic> json) {
    cash = null;
    credit = Credit.fromJson(json['credit']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cash'] = cash;
    _data['credit'] = credit.toJson();
    return _data;
  }
}

class Credit {
  Credit({
    this.nickname,
    this.postedTime,
    required this.price,
    required this.typename,
  });
  late final String? nickname;
  late final String? postedTime;
  late final double? price;
  late final String typename;
  late final DateTime postedDate;

  Credit.fromJson(Map<String, dynamic> json) {
    nickname = null;
    var p = json["price"];
    if (p == 0 || p is int) {
      price = 0.0;
    } else {
      price = json['price'];
    }
    typename = json['__typename'];
    postedTime = json['postedTime'];
    if (postedTime != null) {
      postedDate = DateTime.parse(postedTime.toString());
    } else {
      postedDate = DateTime.now();
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nickname'] = nickname;
    _data['postedTime'] = postedTime;
    _data['price'] = price;
    _data['__typename'] = typename;
    return _data;
  }
}
