class Store {
  Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });
  late final String addr;
  late final String code;
  late final String createdAt;
  late final double lat;
  late final double lng;
  late final String name;
  late final String remainStat;
  late final String stockAt;
  late final String type;
  late double km;

  Store.fromJson(Map<String, dynamic> json){
    addr = json['addr'];
    code = json['code'];
    createdAt = json['created_at'] ?? '';
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    remainStat = json['remain_stat'] ?? '';
    stockAt = json['stock_at'] ?? '';
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['addr'] = addr;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['lat'] = lat;
    data['lng'] = lng;
    data['name'] = name;
    data['remain_stat'] = remainStat;
    data['stock_at'] = stockAt;
    data['type'] = type;
    return data;
  }
}