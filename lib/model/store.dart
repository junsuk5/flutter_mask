class Store {
  String code;
  String name;
  String addr;
  String type;
  num lat;
  num lng;
  String stockAt;
  String remainStat;
  String createdAt;
  num km;

  Store(
      {this.code,
        this.name,
        this.addr,
        this.type,
        this.lat,
        this.lng,
        this.stockAt,
        this.remainStat,
        this.createdAt});

  Store.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    addr = json['addr'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    stockAt = json['stock_at'];
    remainStat = json['remain_stat'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['addr'] = this.addr;
    data['type'] = this.type;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['stock_at'] = this.stockAt;
    data['remain_stat'] = this.remainStat;
    data['created_at'] = this.createdAt;
    return data;
  }
}
