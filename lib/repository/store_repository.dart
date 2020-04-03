import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mask/model/store.dart';

class StoreRepository {

  Future<List<Store>> fetch() async {
    final stores = List<Store>();

    var url =
        'https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat=37.266389&lng=126.999333&m=5000';

    var response = await http.get(url);

    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));

    final jsonStores = jsonResult['stores'];

    jsonStores.forEach((e) {
      stores.add(Store.fromJson(e));
    });
    print('fetch완료');

    return stores.where((e) {
      return e.remainStat == 'plenty' ||
          e.remainStat == 'some' ||
          e.remainStat == 'few';
    }).toList();
  }
}