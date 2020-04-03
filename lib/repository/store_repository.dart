import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';
import 'package:mask/model/store.dart';

class StoreRepository {
  final _distance = Distance();

  Future<List<Store>> fetch(double lat, double lng) async {
    final stores = List<Store>();

    var url =
        'https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat=$lat&lng=$lng&m=5000';

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));

        final jsonStores = jsonResult['stores'];

        jsonStores.forEach((e) {
          final store = Store.fromJson(e);
          final km = _distance.as(LengthUnit.Kilometer,
              LatLng(store.lat, store.lng), LatLng(lat, lng));
          store.km = km;
          stores.add(store);
        });
        print('fetch완료');

        return stores.where((e) {
          return e.remainStat == 'plenty' ||
              e.remainStat == 'some' ||
              e.remainStat == 'few';
        }).toList()
          ..sort((a, b) => a.km.compareTo(b.km));
      } else {
        return [];
      }
    } catch(e) {
      return [];
    }
  }
}