class GasBuddyModel {
  Data? data;

  GasBuddyModel({this.data});

  GasBuddyModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  LocationBySearchTerm? locationBySearchTerm;

  Data({this.locationBySearchTerm});

  Data.fromJson(Map<String, dynamic> json) {
    locationBySearchTerm = json['locationBySearchTerm'] != null
        ? new LocationBySearchTerm.fromJson(json['locationBySearchTerm'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locationBySearchTerm != null) {
      data['locationBySearchTerm'] = this.locationBySearchTerm!.toJson();
    }
    return data;
  }
}

class LocationBySearchTerm {
  Stations? stations;
  String? sTypename;

  LocationBySearchTerm({this.stations, this.sTypename});

  LocationBySearchTerm.fromJson(Map<String, dynamic> json) {
    stations = json['stations'] != null
        ? new Stations.fromJson(json['stations'])
        : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stations != null) {
      data['stations'] = this.stations!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class Stations {
  int? count;
  Cursor? cursor;
  List<Results>? results;
  String? sTypename;

  Stations({this.count, this.cursor, this.results, this.sTypename});

  Stations.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    cursor =
        json['cursor'] != null ? new Cursor.fromJson(json['cursor']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.cursor != null) {
      data['cursor'] = this.cursor!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class Cursor {
  String? next;
  String? sTypename;

  Cursor({this.next, this.sTypename});

  Cursor.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class Results {
  List<String>? fuels;
  String? id;
  String? name;
  List<Prices>? prices;

  Results({this.fuels, this.id, this.name, this.prices});

  Results.fromJson(Map<String, dynamic> json) {
    fuels = json['fuels'].cast<String>();
    id = json['id'];
    name = json['name'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fuels'] = this.fuels;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Prices {
  Null? cash;
  Credit? credit;

  Prices({this.cash, this.credit});

  Prices.fromJson(Map<String, dynamic> json) {
    cash = json['cash'];
    credit =
        json['credit'] != null ? new Credit.fromJson(json['credit']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cash'] = this.cash;
    if (this.credit != null) {
      data['credit'] = this.credit!.toJson();
    }
    return data;
  }
}

class Credit {
  String? nickname;
  String? postedTime;
  double? price;
  String? sTypename;

  Credit({this.nickname, this.postedTime, this.price, this.sTypename});

  Credit.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    postedTime = json['postedTime'];
    price = json['price'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['postedTime'] = this.postedTime;
    data['price'] = this.price;
    data['__typename'] = this.sTypename;
    return data;
  }
}
