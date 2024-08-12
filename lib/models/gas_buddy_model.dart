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
    required this.trends,
    required this.typename,
  });
  late final Stations stations;
  late final List<Trends> trends;
  late final String typename;

  LocationBySearchTerm.fromJson(Map<String, dynamic> json) {
    stations = Stations.fromJson(json['stations']);
    trends = List.from(json['trends']).map((e) => Trends.fromJson(e)).toList();
    typename = json['_typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['stations'] = stations.toJson();
    _data['trends'] = trends.map((e) => e.toJson()).toList();
    _data['_typename'] = typename;
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
    typename = json['_typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['cursor'] = cursor.toJson();
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['_typename'] = typename;
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
    typename = json['_typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['next'] = next;
    _data['_typename'] = typename;
    return _data;
  }
}

class Results {
  Results({
    required this.fuels,
    required this.id,
    required this.name,
    required this.prices,
  });
  late final List<String> fuels;
  late final String id;
  late final String name;
  late final List<Prices> prices;

  Results.fromJson(Map<String, dynamic> json) {
    fuels = List.castFrom<dynamic, String>(json['fuels']);
    id = json['id'];
    name = json['name'];
    prices = List.from(json['prices']).map((e) => Prices.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fuels'] = fuels;
    _data['id'] = id;
    _data['name'] = name;
    _data['prices'] = prices.map((e) => e.toJson()).toList();
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

  Credit.fromJson(Map<String, dynamic> json) {
    nickname = null;
    postedTime = null;
    price = json['price'];
    typename = json['_typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nickname'] = nickname;
    _data['postedTime'] = postedTime;
    _data['price'] = price;
    _data['_typename'] = typename;
    return _data;
  }
}

class Trends {
  Trends({
    required this.areaName,
    required this.country,
    required this.today,
    required this.todayLow,
    required this.trend,
    required this.typename,
  });
  late final String areaName;
  late final String country;
  late final double today;
  late final double? todayLow;
  late final int trend;
  late final String typename;

  Trends.fromJson(Map<String, dynamic> json) {
    areaName = json['areaName'];
    country = json['country'];
    today = json['today'];
    todayLow = json['todayLow'];
    trend = json['trend'];
    typename = json['_typename'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['areaName'] = areaName;
    _data['country'] = country;
    _data['today'] = today;
    _data['todayLow'] = todayLow;
    _data['trend'] = trend;
    _data['_typename'] = typename;
    return _data;
  }
}
