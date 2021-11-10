import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mask/model/store.dart';

class StoreRepository {
  Future<List<Store>> fetch(double lat, double lng) async {
    final List<Store> stores = [];

    var url = Uri.https('gist.githubusercontent.com',
        '/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));

        final jsonStores = jsonResult['stores'];

        jsonStores.forEach((e) {
          final store = Store.fromJson(e);
          final meter =
              Geolocator.distanceBetween(store.lat, store.lng, lat, lng);
          store.km = meter / 1000;
          stores.add(store);
        });

        return stores.where((e) {
          return e.remainStat == 'plenty' ||
              e.remainStat == 'some' ||
              e.remainStat == 'few';
        }).toList()
          ..sort((a, b) => a.km.compareTo(b.km));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
